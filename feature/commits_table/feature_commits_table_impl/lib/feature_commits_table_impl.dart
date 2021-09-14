library feature_commits_table_impl;

import 'package:commits_table_ui_material/commits_table_ui_material.dart';
import 'package:feature_commits_table_api/feature_commits_table_api.dart';

class CommitsTableFeatureApi implements ICommitsTableFeatureApi {
  CommitsTableScreenFactory? _commitsTableScreenFactory;

  @override
  ICommitsTableScreenFactory get workspaceScreenFactory =>
      _commitsTableScreenFactory ??= CommitsTableScreenFactory();
}
