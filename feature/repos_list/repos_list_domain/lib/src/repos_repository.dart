import 'package:repos_list_domain/src/repo.dart';

abstract class IReposRepository {
  Future<List<Repo>> get allRepos;

  Future<void> add(String path);

  Future<Repo?> get(String path);

  Future<bool> remove(String path);
}
