import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';
import '../theme/app_colors.dart';

class CheckboxExamples {
  static Widget build(String style, String theme) {
    final ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(true);

    return StatefulBuilder(
      builder: (context, setState) {
        return ValueListenableBuilder<bool>(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            switch (style) {
              case 'custom':
                return NeoCheckbox(
                  id: 'remember_me',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  label: 'Remember me',
                  activeColor: AppColors.success,
                );
              case 'disabled':
                return NeoCheckbox(
                  id: 'premium_feature',
                  value: false,
                  onChanged: null,
                  label: 'Premium Feature (Unavailable)',
                  enabled: false,
                );
              case 'label_left':
                return NeoCheckbox(
                  id: 'agree_checkbox',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  label: 'Agree to terms',
                  labelOnLeft: true,
                );
              case 'large':
                return NeoCheckbox(
                  id: 'important_option',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  label: 'Enable important feature',
                  size: NeoCheckboxSize.large,
                );
              case 'custom_label':
                return NeoCheckbox(
                  id: 'newsletter',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  labelWidget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Subscribe to newsletter'),
                      SizedBox(width: 4),
                      Icon(Icons.mail, size: 16),
                    ],
                  ),
                );
              case 'standalone':
                return NeoCheckbox(
                  id: 'standalone_checkbox',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                );
              default:
                return NeoCheckbox(
                  id: 'terms_checkbox',
                  value: value,
                  onChanged: (newValue) => valueNotifier.value = newValue,
                  label: 'I accept the terms and conditions',
                );
            }
          },
        );
      },
    );
  }

  // Prevent instantiation
  const CheckboxExamples._();
}
