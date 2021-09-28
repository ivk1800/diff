library feature_commits_list_api;

import 'package:flutter/widgets.dart';

abstract class ICommitsListFeatureApi {
  ICommitsListScreenFactory get commitsListScreenFactory;
}

abstract class ICommitsListScreenFactory {
  Widget create(String repoPath);
}
