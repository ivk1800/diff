import 'package:feature_commits_table_api/feature_commits_table_api.dart';
import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:feature_workspace_api/feature_workspace_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:workspace_ui_material/src/screen/workspace/workspace_page.dart';

class WorkspaceScreenFactory implements IWorkspaceScreenFactory {
  final IReposListScreenFactory _reposListScreenFactory;
  final ICommitsTableScreenFactory _commitsTableScreenFactory;

  WorkspaceScreenFactory({
    required IReposListScreenFactory reposListScreenFactory,
    required ICommitsTableScreenFactory commitsTableScreenFactory,
  })  : _reposListScreenFactory = reposListScreenFactory,
        _commitsTableScreenFactory = commitsTableScreenFactory;

  @override
  Widget create() {
    return MultiProvider(
      providers: <Provider<dynamic>>[
        Provider<IReposListScreenFactory>.value(
          value: _reposListScreenFactory,
        ),
        Provider<ICommitsTableScreenFactory>.value(
          value: _commitsTableScreenFactory,
        ),
      ],
      child: const WorkspacePage(),
    );
  }
}
