library feature_repos_list_impl;

import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:repos_list_ui_material/repos_list_ui_material.dart';

class ReposListFeatureApi implements IReposListFeatureApi {
  ReposListScreenFactory? _reposListScreenFactory;

  @override
  IReposListScreenFactory get reposListScreenFactory =>
      _reposListScreenFactory ??= ReposListScreenFactory();
}
