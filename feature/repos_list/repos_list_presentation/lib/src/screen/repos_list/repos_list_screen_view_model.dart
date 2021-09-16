import 'package:core_arch/core_arch.dart';
import 'package:repos_list_domain/repos_list_domain.dart';

import 'repos_list_router.dart';
import 'repos_state.dart';
import 'tile/model/repo_tile_model.dart';

class ReposListScreenViewModel extends BaseViewModel {
  ReposListScreenViewModel({
    required IReposListRouter router,
    required ReposListInteractor reposListInteractor,
  })  : _reposListInteractor = reposListInteractor,
        _router = router;

  final ReposListInteractor _reposListInteractor;
  final IReposListRouter _router;

  Stream<BodyState> get bodyStateStream =>
      _reposListInteractor.reposStream.map((List<Repo> event) => BodyState.data(
            models: event
                .map((Repo repo) => RepoTileModel(
                      path: repo.path,
                      title: repo.name,
                    ))
                .toList(),
          ));

  void onAddExistingLocalRepositoryTap() {
    _router.toChooseRepoDirectory(_reposListInteractor.add);
  }

  void onRepoRemoveTap(String path) {
    _reposListInteractor.remove(path);
  }

  void onRepoTap(String path) {}
}
