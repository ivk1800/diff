import 'package:core_arch_flutter/core_arch_flutter.dart';
import 'package:feature_commits_list_api/feature_commits_list_api.dart';
import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workspace_presentation/workspace_presentation.dart';

class WorkspacePage extends StatelessWidget {
  const WorkspacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SizedBox(
        width: 400,
        child: Drawer(
          child: context.read<IReposListScreenFactory>().create(),
        ),
      ),
      body: StreamListener<String?>(
        stream: context.read<WorkspaceScreenViewModel>().currentRepo,
        builder: (BuildContext context, String? data) {
          if (data == null) {
            return const Text('repo not selected');
          }

          final ICommitsListScreenFactory commitsTableScreenFactory =
              context.read();

          return commitsTableScreenFactory.create(data);
          // return Text('$data');
        },
      ),
    );
  }
}
