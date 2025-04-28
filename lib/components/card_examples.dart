import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';
import '../theme/app_colors.dart';

class CardExamples {
  static Widget build(String style, String theme) {
    switch (style) {
      case 'custom':
        return NeoCard(
          id: 'colored_card',
          backgroundColor: AppColors.primaryLight,
          borderColor: AppColors.primaryDark,
          borderWidth: 4,
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Custom Styled Card',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray900)),
              SizedBox(height: 8),
              Text(
                  'This card uses custom colors, border width, and elevation to create a unique look.'),
            ],
          ),
        );
      case 'interactive':
        return NeoCard.interactive(
          id: 'interactive_card',
          backgroundColor: AppColors.secondary,
          borderColor: AppColors.black,
          borderWidth: 2,
          elevation: 1.5,
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: AppColors.black),
              SizedBox(width: 12),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Interactive Card',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Tap this card to trigger an action.'),
                  ],
                ),
              ),
            ],
          ),
        );
      case 'media':
        return NeoCard(
          id: 'media_card',
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                color: AppColors.info,
                child: Center(
                    child: Icon(Icons.image, size: 40, color: AppColors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Cards can contain media content'),
              ),
            ],
          ),
        );
      default:
        return NeoCard(
          id: 'basic_card',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Basic Card',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                  'This is a simple card with default styling. It demonstrates the basic neobrutalism card design.'),
            ],
          ),
        );
    }
  }

  // Prevent instantiation
  const CardExamples._();
}
