import 'package:app/src/di/module/feature_module.dart';
import 'package:feature_commits_list_api/feature_commits_list_api.dart';
import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:feature_workspace_api/feature_workspace_api.dart';
import 'package:jugger/jugger.dart' as j;

import 'app_component.dart';

@j.Component(modules: <Type>[FeatureModule], dependencies: <Type>[AppComponent])
abstract class FeatureComponent {
  IWorkspaceFeatureApi getWorkspaceFeatureApi();

  ICommitsListFeatureApi getCommitsListFeatureApi();

  IReposListFeatureApi getReposListFeatureApi();
}

@j.componentBuilder
abstract class FeatureComponentBuilder {
  FeatureComponentBuilder appComponent(AppComponent appComponent);

  FeatureComponent build();
}
