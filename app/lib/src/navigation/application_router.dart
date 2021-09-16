import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:repos_list_presentation/repos_list_presentation.dart';

class ApplicationRouter implements IReposListRouter {
  ApplicationRouter({
    required GlobalKey<NavigatorState> navigationKey,
  }) : _navigationKey = navigationKey;

  final GlobalKey<NavigatorState> _navigationKey;

  @override
  void toChooseRepoDirectory(Function(String path) callback) {
    FilePicker.platform.getDirectoryPath().then((String? path) {
      if (path != null) {
        callback.call(path);
      }
      return path;
    });
  }
}
