import 'package:app/src/di/module/app_module.dart';
import 'package:app/src/feature/feature_provider.dart';
import 'package:jugger/jugger.dart' as j;

@j.Component(modules: <Type>[
  AppModule,
])
abstract class AppComponent {
  FeatureProvider getFeatureProvider();
}

@j.componentBuilder
abstract class AppComponentBuilder {
  AppComponent build();
}
