library feature_commits_table_api;

import 'package:flutter/widgets.dart';

abstract class ICommitsTableFeatureApi {
  ICommitsTableScreenFactory get workspaceScreenFactory;
}

abstract class ICommitsTableScreenFactory {
  Widget create();
}
