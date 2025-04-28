import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';
import '../theme/app_colors.dart';

class ToggleExamples {
  static Widget build(String style, String theme) {
    final ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(true);

    return StatefulBuilder(
      builder: (context, setState) {
        return ValueListenableBuilder<bool>(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            switch (style) {
              case 'custom':
                return NeoToggle(
                  id: 'toggle_custom_colors',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  label: 'Custom Colors',
                  activeColor: AppColors.success,
                  inactiveColor: AppColors.error.withOpacity(0.3),
                  borderColor: AppColors.gray800,
                );
              case 'large':
                return NeoToggle(
                  id: 'toggle_large',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  label: 'Large Toggle',
                  size: 36.0,
                  activeColor: AppColors.info,
                  thumbColor: AppColors.white,
                );
              case 'label_left':
                return NeoToggle(
                  id: 'toggle_left_label',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  label: 'Label on Left',
                  labelOnLeft: true,
                );
              case 'disabled':
                return NeoToggle(
                  id: 'toggle_disabled',
                  value: true,
                  onChanged: null,
                  enabled: false,
                  label: 'Disabled Toggle',
                );
              case 'custom_label':
                return NeoToggle(
                  id: 'toggle_widget_label',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  labelWidget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.dark_mode,
                        color: AppColors.gray800,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Dark Theme',
                        style: TextStyle(
                          color: AppColors.gray800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  activeColor: AppColors.info,
                );
              case 'settings':
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Notifications',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Text(
                          'Enable notifications to stay updated',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.gray600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    NeoToggle(
                      id: 'toggle_notifications',
                      value: value,
                      onChanged: (newValue) => valueNotifier.value = newValue,
                    ),
                  ],
                );
              default:
                return NeoToggle(
                  id: 'toggle_basic',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  label: 'Default Toggle',
                );
            }
          },
        );
      },
    );
  }

  // Prevent instantiation
  const ToggleExamples._();
}
