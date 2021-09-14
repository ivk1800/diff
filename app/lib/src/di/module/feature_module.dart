import 'package:feature_commits_table_api/feature_commits_table_api.dart';
import 'package:feature_commits_table_impl/feature_commits_table_impl.dart';
import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:feature_repos_list_impl/feature_repos_list_impl.dart';
import 'package:feature_workspace_api/feature_workspace_api.dart';
import 'package:feature_workspace_impl/feature_workspace_impl.dart';
import 'package:jugger/jugger.dart' as j;

@j.module
abstract class FeatureModule {
  @j.provide
  static IWorkspaceFeatureApi provideWorkspaceFeatureApi(
    WorkspaceFeatureDependencies dependencies,
  ) =>
      WorkspaceFeatureApi(
        dependencies: dependencies,
      );

  @j.provide
  static ICommitsTableFeatureApi provideCommitsTableFeatureApi() =>
      CommitsTableFeatureApi();

  @j.provide
  static IReposListFeatureApi provideReposListFeatureApi() =>
      ReposListFeatureApi();

  @j.provide
  static WorkspaceFeatureDependencies provideWorkspaceFeatureDependencies(
    ICommitsTableFeatureApi commitsTableFeatureApi,
    IReposListFeatureApi reposListFeatureApi,
  ) =>
      WorkspaceFeatureDependencies(
        reposListScreenFactory: reposListFeatureApi.reposListScreenFactory,
        commitsTableScreenFactory:
            commitsTableFeatureApi.workspaceScreenFactory,
      );
}
