library feature_repos_list_impl;

import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:repos_list_domain/repos_list_domain.dart';
import 'package:repos_list_presentation/repos_list_presentation.dart';

import 'screen/repos_list/repos_list_screen_factory.dart';

class ReposListFeatureApi implements IReposListFeatureApi {
  ReposListFeatureApi({
    required ReposListFeatureDependencies dependencies,
  }) : _dependencies = dependencies;

  final ReposListFeatureDependencies _dependencies;

  ReposListScreenFactory? _reposListScreenFactory;

  @override
  IReposListScreenFactory get reposListScreenFactory =>
      _reposListScreenFactory ??= ReposListScreenFactory(
        dependencies: _dependencies,
      );
}

class ReposListFeatureDependencies {
  ReposListFeatureDependencies({
    required this.reposListInteractor,
    required this.router,
  });

  final ReposListInteractor reposListInteractor;
  final IReposListRouter router;
}
