library feature_commits_list_impl;

import 'package:feature_commits_list_api/feature_commits_list_api.dart';

import 'screen/commits_list/commits_list_screen_factory.dart';

class CommitsListFeatureApi implements ICommitsListFeatureApi {
  CommitsListScreenFactory? _commitsListScreenFactory;

  @override
  ICommitsListScreenFactory get commitsListScreenFactory =>
      _commitsListScreenFactory ??= CommitsListScreenFactory();
}
