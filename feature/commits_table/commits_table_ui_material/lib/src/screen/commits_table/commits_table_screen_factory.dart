import 'package:feature_commits_table_api/feature_commits_table_api.dart';
import 'package:flutter/widgets.dart';

import 'commits_table_page.dart';

class CommitsTableScreenFactory implements ICommitsTableScreenFactory {
  @override
  Widget create() {
    return const CommitsTablePage();
  }
}
