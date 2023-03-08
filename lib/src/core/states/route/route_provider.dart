import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themoviebook/src/ui/views/welcome/welcome.dart';

/// GoRouter configuration
final _kRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePageView(),
    ),
  ],
);

/// create a provider to access the go router configuration
final goRouterProvider = Provider<GoRouter>((ref) {
  return _kRouter;
});
