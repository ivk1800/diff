import 'package:feature_commits_list_api/feature_commits_list_api.dart';
import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:feature_workspace_api/feature_workspace_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:workspace_presentation/workspace_presentation.dart';
import 'package:workspace_ui_material/workspace_ui_material.dart';

class WorkspaceScreenFactory implements IWorkspaceScreenFactory {
  final IReposListScreenFactory _reposListScreenFactory;
  final ICommitsListScreenFactory _commitsTableScreenFactory;

  WorkspaceScreenFactory({
    required IReposListScreenFactory reposListScreenFactory,
    required ICommitsListScreenFactory commitsTableScreenFactory,
  })  : _reposListScreenFactory = reposListScreenFactory,
        _commitsTableScreenFactory = commitsTableScreenFactory;

  @override
  Widget create() {
    return MultiProvider(
      providers: <Provider<dynamic>>[
        Provider<WorkspaceScreenViewModel>(
          create: (_) => WorkspaceScreenViewModel(),
        ),
        Provider<IReposListScreenFactory>.value(
          value: _reposListScreenFactory,
        ),
        Provider<ICommitsListScreenFactory>.value(
          value: _commitsTableScreenFactory,
        ),
      ],
      child: const WorkspacePage(),
    );
  }
}
