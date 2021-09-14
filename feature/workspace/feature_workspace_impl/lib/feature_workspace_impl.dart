library feature_workspace_impl;

import 'package:feature_commits_table_api/feature_commits_table_api.dart';
import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:feature_workspace_api/feature_workspace_api.dart';
import 'package:workspace_ui_material/workspace_ui_material.dart';

class WorkspaceFeatureApi implements IWorkspaceFeatureApi {
  WorkspaceFeatureApi({
    required WorkspaceFeatureDependencies dependencies,
  }) : _dependencies = dependencies;

  final WorkspaceFeatureDependencies _dependencies;

  WorkspaceScreenFactory? _workspaceScreenFactory;

  @override
  IWorkspaceScreenFactory get workspaceScreenFactory =>
      _workspaceScreenFactory ??= WorkspaceScreenFactory(
        commitsTableScreenFactory: _dependencies.commitsTableScreenFactory,
        reposListScreenFactory: _dependencies.reposListScreenFactory,
      );
}

class WorkspaceFeatureDependencies {
  WorkspaceFeatureDependencies({
    required this.commitsTableScreenFactory,
    required this.reposListScreenFactory,
  });

  final ICommitsTableScreenFactory commitsTableScreenFactory;

  final IReposListScreenFactory reposListScreenFactory;
}
