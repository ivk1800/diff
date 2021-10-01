import 'dart:io';

import 'package:git/git.dart' as g;
import 'package:git_client/src/commit.dart';

import 'commit_mapper.dart';

class GitClient {
  final Map<String, Future<g.GitDir>> _dirCache = <String, Future<g.GitDir>>{};

  final CommitMapper _commitMapper = CommitMapper();

  Future<List<Commit>> getCommits(int limit, int offset, String path) async {
    return _getGitDir(path).then((g.GitDir dir) {
      return _getCommitsFromDir(
        path: path,
        limit: limit,
        offset: offset,
        dir: dir,
      );
    });
  }

  Future<bool> isGitDir(String path) => g.GitDir.isGitDir(path);

  Future<g.GitDir> _getGitDir(String path) async =>
      _dirCache.putIfAbsent(path, () => g.GitDir.fromExisting(path));

  Future<List<Commit>> _getCommitsFromDir({
    required String path,
    required int limit,
    required int offset,
    required g.GitDir dir,
  }) async {
    final ProcessResult pr = await dir.runCommand(<String>[
      'rev-list',
      '--format=raw',
      '--date-order',
      '--branches',
      '--remotes',
      '--max-count=$limit',
      '--skip=$offset',
      'HEAD'
    ]);
    final Map<String, g.Commit> rawCommits =
        g.Commit.parseRawRevList(pr.stdout as String);

    return rawCommits.keys.map((String key) {
      final g.Commit commit = rawCommits[key]!;
      return _commitMapper.mapToCommit(key, commit);
    }).toList();
  }
}
