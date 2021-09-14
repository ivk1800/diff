import 'package:feature_repos_list_api/feature_repos_list_api.dart';
import 'package:flutter/widgets.dart';

import 'repos_list_page.dart';

class ReposListScreenFactory implements IReposListScreenFactory {
  @override
  Widget create() {
    return const ReposListPage();
  }
}
