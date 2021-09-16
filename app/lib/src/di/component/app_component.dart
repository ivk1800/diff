import 'package:app/src/di/module/app_module.dart';
import 'package:app/src/feature/feature_provider.dart';
import 'package:app/src/navigation/application_router.dart';
import 'package:jugger/jugger.dart' as j;
import 'package:shared_preferences/shared_preferences.dart';

@j.Component(modules: <Type>[
  AppModule,
])
abstract class AppComponent {
  FeatureProvider getFeatureProvider();

  SharedPreferences getSharedPreferences();

  ApplicationRouter getApplicationRouter();
}

@j.componentBuilder
abstract class AppComponentBuilder {
  AppComponentBuilder sharedPreferences(SharedPreferences database);

  AppComponent build();
}
