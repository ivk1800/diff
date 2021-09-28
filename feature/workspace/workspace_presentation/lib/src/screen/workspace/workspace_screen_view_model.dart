import 'package:core_arch/core_arch.dart';

class WorkspaceScreenViewModel extends BaseViewModel {
  Stream<String?> get currentRepo => Stream<String?>.value('qwe');
}
