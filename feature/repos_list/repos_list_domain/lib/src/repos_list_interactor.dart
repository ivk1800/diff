import 'package:repos_list_domain/src/repo.dart';
import 'package:repos_list_domain/src/repos_repository.dart';
import 'package:rxdart/rxdart.dart';

class ReposListInteractor {
  ReposListInteractor({
    required IReposRepository reposRepository,
  }) : _reposRepository = reposRepository;

  final IReposRepository _reposRepository;
  final PublishSubject<void> _refreshSubject = PublishSubject<void>();

  Stream<List<Repo>> get reposStream =>
      Stream<List<Repo>>.fromFuture(_reposRepository.allRepos)
          .concatWith(<Stream<List<Repo>>>[
        _refreshSubject.asyncMap((_) => _reposRepository.allRepos),
      ]);

  Future<void> add(String path) async {
    await _reposRepository.add(path);
    _refreshSubject.add(null);
  }

  Future<bool> isRepoExist(String path) async =>
      await _reposRepository.get(path) != null;

  Future<void> remove(String path) async {
    final bool isRemoved = await _reposRepository.remove(path);
    if (isRemoved) {
      _refreshSubject.add(null);
    }
  }

  void dispose() {
    _refreshSubject.close();
  }
}
