import 'package:calley/features/Dashboard/presentation/pages/dashboard.dart';
import 'package:calley/features/Dashboard/presentation/pages/landing_page.dart';
import 'package:calley/features/Dashboard/presentation/pages/tests.dart';
import 'package:calley/features/authentication/presentation/pages/login.dart';
import 'package:calley/features/authentication/presentation/pages/otp_verify.dart';
import 'package:calley/features/authentication/presentation/pages/signup.dart';
import 'package:calley/features/settings/presentation/pages/language.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/language',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUp()),
    GoRoute(
      path: '/landing',
      builder: (context, state) {
        return LandingPage();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        return Dashboard();
      },
    ),
    GoRoute(
      path: '/tests',
      builder: (context, state) {
        return Tests();
      },
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) {
        final email = state.extra as String?;
        final phone = state.extra as String?;
        return OTP(email: email ?? '', phone: phone ?? '');
      },
    ),
    GoRoute(
      path: '/language',
      builder: (context, state) => const LanguagePage(),
    ),
  ],
);
