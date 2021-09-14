import 'package:app/main.dart';
import 'package:app/src/di/di.dart';
import 'package:app/src/feature/feature_provider.dart';
import 'package:jugger/jugger.dart' as j;

@j.module
abstract class AppModule {
  @j.singleton
  @j.provide
  static FeatureProvider provideFeatureProvider() {
    return FeatureProvider(
      featureComponent:
          JuggerFeatureComponentBuilder().appComponent(appComponent).build(),
    );
  }
}
