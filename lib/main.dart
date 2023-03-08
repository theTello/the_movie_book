import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themoviebook/src/ui/themes/dark_theme.dart';

import 'firebase_options.dart';
import 'src/core/states/route/route_provider.dart';
import 'src/core/states/theme/theme_provider.dart';
import 'src/ui/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: TheMovieBookRoot(),
    ),
  );
}

/// This is the root of the movie book application
class TheMovieBookRoot extends ConsumerWidget {
  /// the movie book root constructor
  const TheMovieBookRoot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeProvider);
    final goRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, _) {
        return MaterialApp.router(
          routerConfig: goRouter,
          theme: kLightTheme,
          darkTheme: kDarkTheme,
          themeMode: theme,
        );
      },
    );
  }
}
