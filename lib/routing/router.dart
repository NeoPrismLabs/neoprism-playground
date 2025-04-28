import 'package:go_router/go_router.dart';
import 'package:neoprism_playground/pages/home_page.dart';
import '../components/alert_examples.dart';
import '../components/badge_examples.dart';
import '../components/button_examples.dart';
import '../components/card_examples.dart';
import '../components/checkbox_examples.dart';
import '../components/dropdown_examples.dart';
import '../components/input_examples.dart';
import '../components/slider_examples.dart';
import '../components/toggle_examples.dart';
import '../widgets/component_wrapper.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/button',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'standard';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            theme: theme,
            child: ButtonExamples.build(style, theme),
          );
        },
      ),
      GoRoute(
        path: '/alert',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'primary';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            child: AlertExamples.build(style, theme),
          );
        },
      ),
      GoRoute(
        path: '/badge',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'standard';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            child: BadgeExamples.build(style, theme),
          );
        },
      ),
      GoRoute(
        path: '/input',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'standard';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            child: InputExamples.build(style, theme),
          );
        },
      ),
      GoRoute(
        path: '/checkbox',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'standard';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            child: CheckboxExamples.build(style, theme),
          );
        },
      ),
      GoRoute(
        path: '/card',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'standard';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            child: CardExamples.build(style, theme),
          );
        },
      ),
      GoRoute(
        path: '/toggle',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'standard';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            child: ToggleExamples.build(style, theme),
          );
        },
      ),
      GoRoute(
        path: '/dropdown',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'standard';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            child: DropdownExamples.build(style, theme),
          );
        },
      ),
      GoRoute(
        path: '/slider',
        builder: (context, state) {
          final style = state.uri.queryParameters['style'] ?? 'standard';
          final theme = state.uri.queryParameters['theme'] ?? 'light';

          return ComponentWrapper(
            child: SliderExamples.build(style, theme),
          );
        },
      ),
    ],
  );

  const AppRouter._();
}
