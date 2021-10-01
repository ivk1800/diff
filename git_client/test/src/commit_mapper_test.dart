import 'package:git/git.dart' as g;
import 'package:git_client/src/commit.dart';
import 'package:git_client/src/commit_mapper.dart';
import 'package:test/test.dart';

void main() {
  group('CommitMapper', () {
    final CommitMapper mapper = CommitMapper();

    test('should map description', () {
      expect(
        mapper.mapToCommit(commitHash, stdout1Commit).description,
        'test commit',
      );
    });
    test('should map hash', () {
      expect(
        mapper.mapToCommit(commitHash, stdout1Commit).hash,
        commitHash,
      );
    });

    test('should map author', () {
      final Committer author =
          mapper.mapToCommit(commitHash, stdout1Commit).author;
      expect(author.name, 'TestName1');
      expect(author.email, 'test1@test.com');
      expect(
        author.date,
        DateTime.fromMillisecondsSinceEpoch(
          const Duration(seconds: 1631990274).inMilliseconds,
        ),
      );
    });

    test('should map committer', () {
      final Committer author =
          mapper.mapToCommit(commitHash, stdout1Commit).committer;
      expect(author.name, 'TestName2');
      expect(author.email, 'test2@test.com');
      expect(
        author.date,
        DateTime.fromMillisecondsSinceEpoch(
          const Duration(seconds: 1631990274).inMilliseconds,
        ),
      );
    });
  });
}

final g.Commit stdout1Commit = g.Commit.parseRawRevList(stdout1).values.first;

const String commitHash = 'commitHash';

const String stdout1 = '''
commit 0c9189f9904fc2803aca927cad44dac3b1f3b6e1
tree bea6ae9bf70af8f59642f4b005bd2afec8167353
author TestName1 <test1@test.com> 1631990274 +0400
committer TestName2 <test2@test.com> 1631990274 +0400

    test commit
''';
