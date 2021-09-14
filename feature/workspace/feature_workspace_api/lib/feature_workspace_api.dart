library feature_workspace_api;

import 'package:flutter/widgets.dart';

abstract class IWorkspaceFeatureApi {
  IWorkspaceScreenFactory get workspaceScreenFactory;
}

abstract class IWorkspaceScreenFactory {
  Widget create();
}
