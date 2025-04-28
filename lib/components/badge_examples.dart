import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';
import '../theme/app_colors.dart';

class BadgeExamples {
  static Widget build(String style, String theme) {
    switch (style) {
      case 'status':
        return NeoBadge.status(
          id: 'status_badge',
          label: 'Active',
          backgroundColor: AppColors.success,
        );
      case 'counter':
        return NeoBadge.counter(
          id: 'notification_badge',
          count: 5,
          backgroundColor: AppColors.error,
        );
      case 'dot':
        return NeoBadge.dot(
          id: 'dot_badge',
          backgroundColor: AppColors.warning,
        );
      case 'custom':
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            NeoBadge(
              id: 'basic_badge',
              label: 'New',
              backgroundColor: AppColors.primary,
            ),
            SizedBox(width: 8),
            NeoBadge.status(
              id: 'active_status',
              label: 'Active',
              backgroundColor: AppColors.success,
              shadowOffset: Offset(0, 0),
            ),
          ],
        );
      default:
        return NeoBadge(
          id: 'standard_badge',
          label: 'New',
          backgroundColor: AppColors.info,
        );
    }
  }

  // Prevent instantiation
  const BadgeExamples._();
}
