import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkspacePage extends StatelessWidget {
  const WorkspacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: context.read<IReposListScreenFactory>().create(),
      ),
      body: const Center(
        child: Text('Workspace'),
      ),
    );
  }
}
