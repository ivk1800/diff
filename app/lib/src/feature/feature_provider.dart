import 'package:app/src/di/component/feature_component.dart';
import 'package:feature_workspace_api/feature_workspace_api.dart';

class FeatureProvider {
  FeatureProvider({required FeatureComponent featureComponent})
      : _featureComponent = featureComponent;

  final FeatureComponent _featureComponent;

  IWorkspaceFeatureApi? _workspaceFeatureApi;

  IWorkspaceFeatureApi get workspaceFeatureApi =>
      _workspaceFeatureApi ??= _featureComponent.getWorkspaceFeatureApi();
}
