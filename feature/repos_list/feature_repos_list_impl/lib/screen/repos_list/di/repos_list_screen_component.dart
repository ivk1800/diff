import 'package:feature_repos_list_impl/feature_repos_list_impl.dart';
import 'package:feature_repos_list_impl/screen/repos_list/tile_listener.dart';
import 'package:jugger/jugger.dart' as j;
import 'package:repos_list_presentation/repos_list_presentation.dart';
import 'package:repos_list_ui_material/repos_list_ui_material.dart';
import 'package:tile_flutter/tile_flutter.dart';

@j.Component(modules: <Type>[ReposListScreenModule])
abstract class ReposListScreenComponent {
  ReposListScreenViewModel getReposListScreenViewModel();

  TileFactory getTileFactory();
}

@j.module
abstract class ReposListScreenModule {
  @j.provide
  @j.singleton
  static TileFactory provideTileFactory(
    TileListener tileListener,
  ) =>
      TileFactory(
        delegates: <Type, ITileFactoryDelegate<ITileModel>>{
          RepoTileModel: RepoTileFactoryDelegate(
            listener: tileListener,
          ),
        },
      );

  @j.provide
  @j.singleton
  static TileListener provideTileListener(
    ReposListScreenViewModel viewModel,
  ) =>
      TileListener(
        viewModel: viewModel,
      );

  @j.provide
  @j.singleton
  static ReposListScreenViewModel provideReposListScreenViewModel(
    ReposListFeatureDependencies dependencies,
  ) =>
      ReposListScreenViewModel(
        router: dependencies.router,
        reposListInteractor: dependencies.reposListInteractor,
      );
}

@j.componentBuilder
abstract class ReposListScreenComponentBuilder {
  ReposListScreenComponentBuilder dependencies(
    ReposListFeatureDependencies dependencies,
  );

  ReposListScreenComponent build();
}
