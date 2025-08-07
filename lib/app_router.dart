import 'package:go_router/go_router.dart';
import 'package:potion_maker/screens/screens.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainScreen(),
        routes: [
          GoRoute(
            path: 'wheel',
            builder: (context, state) => WheelGameScreen(),
          ),
          GoRoute(
            path: 'garden',
            builder: (context, state) => GreenhouseScreen(),
          ),
        ],
      ),
    ],
  );
}
