import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neoprism_core/neoprism_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;
import '../theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            // Use constraints to determine responsive behavior
            final isSmallScreen = constraints.maxWidth < 600;
            final isMediumScreen = constraints.maxWidth < 900;

            return Padding(
              padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(isSmallScreen),
                  const SizedBox(height: 30),
                  _buildNavigation(context, isMediumScreen),
                  _buildIntroduction(isSmallScreen),
                  const SizedBox(height: 30),
                  _buildComponentGrid(context, isSmallScreen, isMediumScreen),
                  const SizedBox(height: 40),
                  _buildFooter(context, isSmallScreen),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  // Responsive header
  Widget _buildHeader(bool isSmallScreen) {
    return Builder(builder: (context) {
      final theme = Theme.of(context);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NeoCard(
                      id: 'logo_card',
                      backgroundColor: AppColors.primary,
                      borderColor: AppColors.primaryDark,
                      borderWidth: 3,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.diamond_outlined, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'NeoPrism',
                            style: theme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Playground',
                      style: theme.textTheme.displayMedium,
                    ),
                  ],
                )
              : Row(
                  children: [
                    NeoCard(
                      id: 'logo_card',
                      backgroundColor: AppColors.primary,
                      borderColor: AppColors.primaryDark,
                      borderWidth: 3,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.diamond_outlined, size: 28),
                          SizedBox(width: 8),
                          Text(
                            'NeoPrism',
                            style: theme.textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Playground',
                      style: theme.textTheme.displayLarge,
                    ),
                  ],
                ),
          SizedBox(height: isSmallScreen ? 12 : 20),
          Text(
            'Interactive component showcase for the NeoPrism UI library',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.gray600,
              fontSize: isSmallScreen ? 16 : 20,
            ),
          ),
        ],
      );
    });
  }

  // Responsive introduction
  Widget _buildIntroduction(bool isSmallScreen) {
    return Builder(builder: (context) {
      final theme = Theme.of(context);

      return NeoCard(
        id: 'intro_card',
        elevation: 2,
        backgroundColor: AppColors.primaryLight,
        borderColor: AppColors.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is this?',
              style: isSmallScreen
                  ? theme.textTheme.headlineLarge
                  : theme.textTheme.displaySmall,
            ),
            SizedBox(height: 16),
            Text(
              'NeoPrism Playground is an interactive showcase of UI components that can be embedded in documentation via iframes. '
              'Click on any component below to see it in isolation, or use the URL pattern to directly access specific component styles.',
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
            ),
            SizedBox(height: 20),
            NeoCard(
              id: 'url_pattern_card',
              backgroundColor: Colors.white,
              borderColor: AppColors.gray400,
              child: Padding(
                padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.link, color: AppColors.primary),
                        SizedBox(width: 8),
                        Text(
                          'URL Pattern:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isSmallScreen ? 14 : 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SelectableText(
                        'http://playground.neoprismlabs.in/#/[component]?style=[style-variant]&theme=[light|dark]',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: isSmallScreen ? 12 : 14,
                          color: AppColors.gray800,
                          background: Paint()..color = AppColors.gray100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  // Responsive navigation
  Widget _buildNavigation(BuildContext context, bool isMediumScreen) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: NeoCard(
        id: 'navigation_card',
        backgroundColor: AppColors.gray100,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: isMediumScreen
            ? Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  _navItem(context, 'Buttons', Icons.touch_app, 'button'),
                  _navItem(context, 'Alerts', Icons.announcement, 'alert'),
                  _navItem(context, 'Badges', Icons.local_offer, 'badge'),
                  _navItem(context, 'Inputs', Icons.input, 'input'),
                  _navItem(context, 'Checkboxes', Icons.check_box, 'checkbox'),
                  _navItem(context, 'Cards', Icons.credit_card, 'card'),
                  _navItem(context, 'Toggles', Icons.toggle_on, 'toggle'),
                  _navItem(context, 'Dropdowns', Icons.arrow_drop_down_circle,
                      'dropdown'),
                  _navItem(context, 'Sliders', Icons.tune, 'slider'),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _navItem(context, 'Buttons', Icons.touch_app, 'button'),
                  _navItem(context, 'Alerts', Icons.announcement, 'alert'),
                  _navItem(context, 'Badges', Icons.local_offer, 'badge'),
                  _navItem(context, 'Inputs', Icons.input, 'input'),
                  _navItem(context, 'Checkboxes', Icons.check_box, 'checkbox'),
                  _navItem(context, 'Cards', Icons.credit_card, 'card'),
                  _navItem(context, 'Toggles', Icons.toggle_on, 'toggle'),
                  _navItem(context, 'Dropdowns', Icons.arrow_drop_down_circle,
                      'dropdown'),
                  _navItem(context, 'Sliders', Icons.tune, 'slider'),
                ],
              ),
      ),
    );
  }

  // Navigation item
  Widget _navItem(
      BuildContext context, String label, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => context.go('/$route'),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: AppColors.gray800),
              SizedBox(width: 4),
              Text(label,
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.gray800,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  // Responsive component grid
  Widget _buildComponentGrid(
      BuildContext context, bool isSmallScreen, bool isMediumScreen) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Components',
          style: isSmallScreen
              ? theme.textTheme.headlineLarge
              : theme.textTheme.displaySmall,
        ),
        SizedBox(height: 24),
        Wrap(
          spacing: isSmallScreen ? 10 : 20,
          runSpacing: isSmallScreen ? 10 : 20,
          children: [
            // Same component cards but with responsive width
            _buildComponentCard(
              context,
              'Buttons',
              Icons.touch_app,
              AppColors.primary,
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('icon', 'With Icon'),
                ComponentStyle('compressed', 'Compressed'),
                ComponentStyle('small', 'Small'),
                ComponentStyle('large', 'Large'),
                ComponentStyle('custom', 'Custom'),
                ComponentStyle('disabled', 'Disabled'),
              ],
              'button',
              isSmallScreen,
              isMediumScreen,
            ),
            _buildComponentCard(
              context,
              'Alerts',
              Icons.announcement,
              const Color.fromARGB(255, 94, 152, 213),
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('destructive', 'Destructive'),
                ComponentStyle('custom', 'Custom'),
                ComponentStyle('simple', 'Simple'),
                ComponentStyle('longContent', 'Long Content'),
              ],
              'alert',
              isSmallScreen,
              isMediumScreen,
            ),
            _buildComponentCard(
              context,
              'Badges',
              Icons.local_offer,
              AppColors.warning,
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('status', 'Status'),
                ComponentStyle('counter', 'Counter'),
                ComponentStyle('dot', 'Dot'),
                ComponentStyle('custom', 'Custom'),
              ],
              'badge',
              isSmallScreen,
              isMediumScreen,
            ),
            _buildComponentCard(
              context,
              'Inputs',
              Icons.input,
              AppColors.secondary,
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('password', 'Password'),
                ComponentStyle('multiline', 'Multiline'),
                ComponentStyle('small', 'Small'),
                ComponentStyle('error', 'Error'),
                ComponentStyle('disabled', 'Disabled'),
                ComponentStyle('prefix', 'With Prefix'),
              ],
              'input',
              isSmallScreen,
              isMediumScreen,
            ),
            _buildComponentCard(
              context,
              'Checkboxes',
              Icons.check_box,
              AppColors.success,
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('custom', 'Custom Color'),
                ComponentStyle('disabled', 'Disabled'),
                ComponentStyle('label_left', 'Label Left'),
                ComponentStyle('large', 'Large'),
                ComponentStyle('custom_label', 'Custom Label'),
                ComponentStyle('standalone', 'Standalone'),
              ],
              'checkbox',
              isSmallScreen,
              isMediumScreen,
            ),
            _buildComponentCard(
              context,
              'Cards',
              Icons.credit_card,
              const Color.fromARGB(255, 233, 127, 122),
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('custom', 'Custom'),
                ComponentStyle('interactive', 'Interactive'),
                ComponentStyle('media', 'Media'),
              ],
              'card',
              isSmallScreen,
              isMediumScreen,
            ),
            _buildComponentCard(
              context,
              'Toggles',
              Icons.toggle_on,
              AppColors.primaryDark,
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('custom', 'Custom'),
                ComponentStyle('large', 'Large'),
                ComponentStyle('label_left', 'Label Left'),
                ComponentStyle('disabled', 'Disabled'),
                ComponentStyle('custom_label', 'Custom Label'),
                ComponentStyle('settings', 'Settings'),
              ],
              'toggle',
              isSmallScreen,
              isMediumScreen,
            ),
            _buildComponentCard(
              context,
              'Dropdowns',
              Icons.arrow_drop_down_circle,
              const Color.fromARGB(255, 71, 147, 228),
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('icons', 'With Icons'),
                ComponentStyle('custom', 'Custom'),
                ComponentStyle('disabled', 'Disabled'),
              ],
              'dropdown',
              isSmallScreen,
              isMediumScreen,
            ),
            _buildComponentCard(
              context,
              'Sliders',
              Icons.tune,
              AppColors.warning,
              [
                ComponentStyle('standard', 'Default'),
                ComponentStyle('discrete', 'Discrete'),
                ComponentStyle('custom', 'Custom'),
                ComponentStyle('disabled', 'Disabled'),
              ],
              'slider',
              isSmallScreen,
              isMediumScreen,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildComponentCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    List<ComponentStyle> styles,
    String componentRoute,
    bool isSmallScreen,
    bool isMediumScreen,
  ) {
    final theme = Theme.of(context);

    return NeoCard(
      id: '${title.toLowerCase()}_card',
      backgroundColor: Colors.white,
      borderColor: color,
      borderWidth: 3,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              border: Border(bottom: BorderSide(color: color, width: 2)),
            ),
            child: Row(
              children: [
                Icon(icon, color: color, size: isSmallScreen ? 24 : 28),
                SizedBox(width: 12),
                Text(
                  title,
                  style: isSmallScreen
                      ? theme.textTheme.headlineMedium
                      : theme.textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: styles.map((style) {
                return NeoButton.small(
                  id: '${componentRoute}_${style.value}_btn',
                  label: style.name,
                  backgroundColor: color,
                  borderColor: Colors.black,
                  textColor: AppColors.gray800,
                  onPressed: () {
                    context.go('/$componentRoute?style=${style.value}');
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, isSmallScreen ? 12 : 16),
            child: isSmallScreen
                ? Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: NeoButton.small(
                          id: 'view_all_${componentRoute}_btn',
                          label: 'View Default',
                          backgroundColor: color,
                          borderColor: Colors.black,
                          textColor: AppColors.gray800,
                          onPressed: () {
                            context.go('/$componentRoute');
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: NeoButton.small(
                          id: 'dark_${componentRoute}_btn',
                          label: 'Dark Theme',
                          backgroundColor: AppColors.gray800,
                          textColor: Colors.white,
                          onPressed: () {
                            context.go('/$componentRoute?theme=dark');
                          },
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NeoButton.small(
                        id: 'view_all_${componentRoute}_btn',
                        label: 'View Default',
                        backgroundColor: color,
                        borderColor: Colors.black,
                        textColor: AppColors.gray800,
                        onPressed: () {
                          context.go('/$componentRoute');
                        },
                      ),
                      NeoButton.small(
                        id: 'dark_${componentRoute}_btn',
                        label: 'Dark Theme',
                        backgroundColor: AppColors.gray800,
                        textColor: Colors.white,
                        onPressed: () {
                          context.go('/$componentRoute?theme=dark');
                        },
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // Responsive footer
  Widget _buildFooter(BuildContext context, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(thickness: 2),
        SizedBox(height: 20),
        isSmallScreen
            ? Column(
                children: [
                  Text(
                    '© 2025 NeoPrismLabs UI Library',
                    style: TextStyle(color: AppColors.gray600),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeoButton.small(
                        id: 'github_btn',
                        label: 'GitHub',
                        backgroundColor: AppColors.gray200,
                        textColor: AppColors.gray800,
                        onPressed: () {
                          _launchURL('https://github.com/NeoPrismLabs');
                        },
                      ),
                      SizedBox(width: 10),
                      NeoButton.small(
                        id: 'docs_btn',
                        label: 'Documentation',
                        backgroundColor: AppColors.gray200,
                        textColor: AppColors.gray800,
                        onPressed: () {
                          _launchURL('https://docs.neoprismlabs.in');
                        },
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '© 2025 NeoPrismLabs UI Library',
                    style: TextStyle(color: AppColors.gray600),
                  ),
                  SizedBox(width: 20),
                  NeoButton.small(
                    id: 'github_btn',
                    label: 'GitHub',
                    backgroundColor: AppColors.gray200,
                    textColor: AppColors.gray800,
                    onPressed: () {
                      _launchURL('https://github.com/NeoPrismLabs');
                    },
                  ),
                  SizedBox(width: 10),
                  NeoButton.small(
                    id: 'docs_btn',
                    label: 'Documentation',
                    backgroundColor: AppColors.gray200,
                    textColor: AppColors.gray800,
                    onPressed: () {
                      _launchURL('https://docs.neoprismlabs.in');
                    },
                  ),
                ],
              ),
        SizedBox(height: 20),
      ],
    );
  }
}

class ComponentStyle {
  final String value;
  final String name;

  ComponentStyle(this.value, this.name);
}

void _launchURL(String url) async {
  if (kIsWeb) {
    js.context.callMethod('open', [url, '_blank']);
  } else {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
