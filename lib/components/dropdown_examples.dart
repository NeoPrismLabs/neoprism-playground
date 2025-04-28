import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';
import '../theme/app_colors.dart';

class DropdownExamples {
  static Widget build(String style, String theme) {
    final ValueNotifier<String?> countryNotifier = ValueNotifier<String?>(null);
    final ValueNotifier<String?> fruitNotifier = ValueNotifier<String?>(null);
    final ValueNotifier<String?> sizeNotifier = ValueNotifier<String?>(null);

    final backgroundColor = theme == 'dark' ? AppColors.gray800 : Colors.white;
    final textColor = theme == 'dark' ? AppColors.gray200 : AppColors.gray900;
    final borderColor =
        theme == 'dark' ? AppColors.primaryDark : AppColors.gray400;
    final iconColor =
        theme == 'dark' ? AppColors.primaryLight : AppColors.primary;

    switch (style) {
      case 'icons':
        return ValueListenableBuilder<String?>(
            valueListenable: fruitNotifier,
            builder: (context, selectedFruit, _) {
              return NeoDropdown<String>(
                id: 'fruit_dropdown',
                value: selectedFruit,
                items: [
                  NeoDropdownItem(
                    value: 'apple',
                    label: 'Apple',
                    icon: Icons.apple,
                  ),
                  NeoDropdownItem(
                    value: 'banana',
                    label: 'Banana',
                    icon: Icons.emoji_food_beverage,
                  ),
                  NeoDropdownItem(
                    value: 'orange',
                    label: 'Orange',
                    icon: Icons.circle,
                  ),
                  NeoDropdownItem(
                    value: 'grape',
                    label: 'Grape',
                    icon: Icons.bubble_chart,
                  ),
                ],
                onChanged: (value) {
                  fruitNotifier.value = value;
                },
                label: 'Select Fruit',
                placeholder: 'Choose a fruit',
                showIcons: true,
                // Apply theme-specific styling
                backgroundColor: backgroundColor,
                textColor: textColor,
                borderColor: borderColor,
                dropdownIconColor: iconColor,
              );
            });

      case 'custom':
        return ValueListenableBuilder<String?>(
            valueListenable: sizeNotifier,
            builder: (context, selectedSize, _) {
              return NeoDropdown<String>(
                id: 'size_dropdown',
                value: selectedSize,
                items: [
                  NeoDropdownItem(value: 'xs', label: 'Extra Small'),
                  NeoDropdownItem(value: 's', label: 'Small'),
                  NeoDropdownItem(value: 'm', label: 'Medium'),
                  NeoDropdownItem(value: 'l', label: 'Large'),
                  NeoDropdownItem(value: 'xl', label: 'Extra Large'),
                ],
                onChanged: (value) {
                  sizeNotifier.value = value;
                },
                label: 'Select Size',
                placeholder: 'Choose a size',
                backgroundColor: AppColors.primaryLight,
                borderColor: AppColors.primaryDark,
                textColor: AppColors.gray900,
                dropdownIcon: Icons.arrow_drop_down_circle,
                dropdownIconColor: AppColors.primaryDark,
                borderWidth: 3,
                showDividers: true,
                size: NeoDropdownSize.large,
              );
            });

      case 'disabled':
        return NeoDropdown<String>(
          id: 'disabled_dropdown',
          value: 'disabled',
          items: [
            NeoDropdownItem(value: 'disabled', label: 'Disabled Dropdown'),
          ],
          onChanged: null,
          enabled: false,
          label: 'Disabled Dropdown',
          placeholder: 'This dropdown is disabled',
        );

      default:
        return ValueListenableBuilder<String?>(
            valueListenable: countryNotifier,
            builder: (context, selectedCountry, _) {
              return NeoDropdown<String>(
                id: 'country_dropdown',
                value: selectedCountry,
                items: [
                  NeoDropdownItem(value: 'us', label: 'United States'),
                  NeoDropdownItem(value: 'ca', label: 'Canada'),
                  NeoDropdownItem(value: 'uk', label: 'United Kingdom'),
                  NeoDropdownItem(value: 'au', label: 'Australia'),
                  NeoDropdownItem(value: 'jp', label: 'Japan'),
                  NeoDropdownItem(value: 'de', label: 'Germany'),
                ],
                onChanged: (value) {
                  countryNotifier.value = value;
                },
                backgroundColor: backgroundColor,
                label: 'Select Country',
                placeholder: 'Choose a country',
              );
            });
    }
  }

  // Prevent instantiation
  const DropdownExamples._();
}
