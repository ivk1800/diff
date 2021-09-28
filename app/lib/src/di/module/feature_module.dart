import 'package:app/src/navigation/application_router.dart';
import 'package:feature_commits_list_api/feature_commits_list_api.dart';
import 'package:feature_commits_list_impl/feature_commits_list_impl.dart';
import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:feature_repos_list_impl/feature_repos_list_impl.dart';
import 'package:feature_workspace_api/feature_workspace_api.dart';
import 'package:feature_workspace_impl/feature_workspace_impl.dart';
import 'package:jugger/jugger.dart' as j;
import 'package:repos_list_data/repos_list_data.dart';
import 'package:repos_list_domain/repos_list_domain.dart';
import 'package:repos_list_presentation/repos_list_presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static ICommitsListFeatureApi provideCommitsListFeatureApi() =>
      CommitsListFeatureApi();

  @j.provide
  static IReposListFeatureApi provideReposListFeatureApi(
    SharedPreferences sharedPreferences,
    IReposListRouter router,
  ) =>
      ReposListFeatureApi(
        dependencies: ReposListFeatureDependencies(
          router: router,
          reposListInteractor: ReposListInteractor(
            reposRepository: ReposRepositoryImpl(
              sharedPreferences: sharedPreferences,
            ),
          ),
        ),
      );

  @j.provide
  static WorkspaceFeatureDependencies provideWorkspaceFeatureDependencies(
    ICommitsListFeatureApi commitsListFeatureApi,
    IReposListFeatureApi reposListFeatureApi,
  ) =>
      WorkspaceFeatureDependencies(
        reposListScreenFactory: reposListFeatureApi.reposListScreenFactory,
        commitsTableScreenFactory:
            commitsListFeatureApi.commitsListScreenFactory,
      );

  // todo replace by bind, ApplicationRouter provided from app component,
  // bind not work
  @j.provide
  static IReposListRouter bindReposListRouter(ApplicationRouter impl) => impl;
}
