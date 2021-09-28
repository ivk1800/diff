import 'package:flutter/material.dart';

import 'widget/commits_table.dart';
import 'widget/tile/simple_commits_table_delegate.dart';

class CommitsListPage extends StatelessWidget {
  const CommitsListPage({Key? key, required this.repoPath}) : super(key: key);

  final String repoPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommitsTable(
        delegate: SimpleCommitsTableDelegate(),
      ),
    );
  }
}
