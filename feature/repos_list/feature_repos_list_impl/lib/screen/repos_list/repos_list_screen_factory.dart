import 'package:core_arch_flutter/core_arch_flutter.dart';
import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:feature_repos_list_impl/feature_repos_list_impl.dart';
import 'package:feature_repos_list_impl/screen/repos_list/di/repos_list_screen_component.dart';
import 'package:feature_repos_list_impl/screen/repos_list/di/repos_list_screen_component.jugger.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:repos_list_presentation/repos_list_presentation.dart';
import 'package:repos_list_ui_material/repos_list_ui_material.dart';
import 'package:tile_flutter/tile_flutter.dart';

class ReposListScreenFactory implements IReposListScreenFactory {
  ReposListScreenFactory({
    required ReposListFeatureDependencies dependencies,
  }) : _dependencies = dependencies;

  final ReposListFeatureDependencies _dependencies;

  @override
  Widget create() {
    return Scope<ReposListScreenComponent>(
      child: const ReposListPage(),
      create: () => JuggerReposListScreenComponentBuilder()
          .dependencies(_dependencies)
          .build(),
      providers: (ReposListScreenComponent component) => <Provider<dynamic>>[
        Provider<TileFactory>(
          create: (_) => component.getTileFactory(),
        ),
        Provider<ReposListScreenViewModel>(
          create: (_) => component.getReposListScreenViewModel(),
        ),
      ],
    );
  }
}
