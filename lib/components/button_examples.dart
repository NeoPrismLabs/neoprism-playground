import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';
import '../theme/app_colors.dart';

class ButtonExamples {
  static Widget build(String style, String theme) {
    switch (style) {
      case 'icon':
        return NeoButton.icon(
          id: 'save_button',
          icon: Icons.check,
          label: 'Save',
          onPressed: () {},
        );
      case 'compressed':
        return NeoButton.compressed(
          id: 'compact_button',
          label: 'Compressed',
          onPressed: () {},
        );
      case 'small':
        return NeoButton.small(
          id: 'small_button',
          label: 'Small Button',
          backgroundColor: AppColors.gray200,
          textColor: AppColors.black,
          onPressed: () {},
        );
      case 'large':
        return NeoButton.large(
          id: 'large_button',
          label: 'Large Button',
          backgroundColor: AppColors.secondary,
          onPressed: () {},
        );
      case 'custom':
        return NeoButton.custom(
          id: 'custom_button',
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: AppColors.black),
              SizedBox(width: 8),
              Text('Custom Button'),
              SizedBox(width: 4),
              Icon(Icons.star, color: AppColors.black),
            ],
          ),
        );
      case 'disabled':
        return NeoButton(
          id: 'disabled_button',
          label: 'Disabled Button',
          onPressed: null,
        );
      default:
        return NeoButton(
          id: 'standard_button',
          label: 'Standard Button',
          onPressed: () {},
        );
    }
  }

  // Prevent instantiation
  const ButtonExamples._();
}
