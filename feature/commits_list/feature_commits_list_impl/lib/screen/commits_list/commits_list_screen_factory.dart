import 'package:commits_list_ui_material/commits_list_ui_material.dart';
import 'package:feature_commits_list_api/feature_commits_list_api.dart';
import 'package:flutter/widgets.dart';

class CommitsListScreenFactory implements ICommitsListScreenFactory {
  @override
  Widget create(String repoPath) {
    return CommitsListPage(
      repoPath: repoPath,
    );
  }
}
