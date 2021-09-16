import 'package:app/main.dart';
import 'package:app/src/di/di.dart';
import 'package:app/src/feature/feature_provider.dart';
import 'package:app/src/navigation/application_router.dart';
import 'package:app/src/widget/diff_app.dart';
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

  @j.singleton
  @j.provide
  static ApplicationRouter provideApplicationRouter() =>
      ApplicationRouter(navigationKey: DiffApp.navigatorKey);
}
