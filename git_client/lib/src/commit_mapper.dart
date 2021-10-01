import 'package:git/git.dart' as g;
import 'package:git_client/src/commit.dart';

class CommitMapper {
  final RegExp _dateRegExp = RegExp(' ([0-9]+) ');
  final RegExp _emailRegExp = RegExp(' <(.*)> ');
  final RegExp _nameRegExp = RegExp('^(.*) <');

  Commit mapToCommit(String commitHash, g.Commit commit) {
    return Commit(
      description: commit.message,
      hash: commitHash,
      author: _mapToCommitter(commit.author),
      committer: _mapToCommitter(commit.committer),
    );
  }

  Committer _mapToCommitter(String committerRaw) {
    final String dateRaw = _dateRegExp.firstMatch(committerRaw)!.group(1)!;

    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      Duration(seconds: int.parse(dateRaw)).inMilliseconds,
    );
    return Committer(
      name: _nameRegExp.firstMatch(committerRaw)!.group(1)!,
      email: _emailRegExp.firstMatch(committerRaw)!.group(1)!,
      date: dateTime,
    );
  }
}
