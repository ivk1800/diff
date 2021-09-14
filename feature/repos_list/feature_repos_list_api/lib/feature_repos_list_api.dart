library feature_repos_list_api;

import 'package:flutter/widgets.dart';

abstract class IReposListFeatureApi {
  IReposListScreenFactory get reposListScreenFactory;
}

abstract class IReposListScreenFactory {
  Widget create();
}
