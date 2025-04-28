import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ComponentWrapper extends StatelessWidget {
  final Widget child;
  final String theme;

  const ComponentWrapper({
    super.key,
    required this.child,
    this.theme = 'light',
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.getThemeForName(theme),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
