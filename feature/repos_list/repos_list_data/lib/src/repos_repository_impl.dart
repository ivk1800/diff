import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:repos_list_data/src/repo_entity.dart';
import 'package:repos_list_data/src/repos_entity.dart';
import 'package:repos_list_domain/repos_list_domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReposRepositoryImpl implements IReposRepository {
  ReposRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> add(String path) async {
    final RepoEntity repo = RepoEntity(path: path, name: path.split('/').last);

    _write(_read()..add(repo));
  }

  @override
  Future<List<Repo>> get allRepos async {
    return _read().map((RepoEntity e) => e.toRepo()).toList();
  }

  @override
  Future<bool> remove(String path) async {
    final List<RepoEntity> repos = _read();
    final int length = repos.length;
    _write(repos..removeWhere((RepoEntity element) => element.path == path));
    return repos.length != length;
  }

  @override
  Future<Repo?> get(String path) async {
    return _read()
        .firstWhereOrNull((RepoEntity element) => element.path == path)
        ?.toRepo();
  }

  void _write(List<RepoEntity> value) {
    _sharedPreferences.setString(
      'repos',
      jsonEncode(ReposEntity(repos: value).toJson()),
    );
  }

  List<RepoEntity> _read() {
    final String? json = _sharedPreferences.getString('repos');

    if (json == null) {
      return <RepoEntity>[];
    }

    return ReposEntity.fromJson(jsonDecode(json) as Map<String, dynamic>).repos;
  }
}

extension _RepoExt on RepoEntity {
  Repo toRepo() => Repo(path: path, name: name);
}
