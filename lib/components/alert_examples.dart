import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';
import '../theme/app_colors.dart';

class AlertExamples {
  static Widget build(String style, String theme) {
    switch (style) {
      case 'destructive':
        return _buildAlertPreview(
          title: 'Error',
          content: 'Your session has expired. Please log in again.',
          confirmLabel: 'Log In',
          cancelLabel: 'Cancel',
          backgroundColor: Colors.red[50],
          borderColor: AppColors.error,
        );
      case 'custom':
        return _buildAlertPreview(
          title: 'Custom Style',
          content: 'This dialog has custom colors and styling.',
          confirmLabel: 'Cool!',
          backgroundColor: AppColors.primaryLight,
          borderColor: AppColors.warning,
        );
      case 'simple':
        return _buildAlertPreview(
          title: 'Simple Alert',
          content: 'This is a simple alert with just a confirm button.',
          confirmLabel: 'OK',
          showCancel: false,
          backgroundColor: Colors.blue[50],
          borderColor: AppColors.info,
        );
      case 'longContent':
        return _buildAlertPreview(
          title: 'Terms and Conditions',
          content:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          confirmLabel: 'Accept',
          cancelLabel: 'Decline',
          backgroundColor: Colors.green[50],
          borderColor: AppColors.success,
        );
      default:
        return _buildAlertPreview(
          title: 'Information',
          content: 'This is a basic neobrutalism-styled alert dialog.',
          confirmLabel: 'Got it',
          backgroundColor: Colors.blue[50],
          borderColor: AppColors.info,
        );
    }
  }

  static Widget _buildAlertPreview({
    required String title,
    required String content,
    required String confirmLabel,
    String? cancelLabel,
    bool showCancel = true,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return NeoCard(
      id: 'alert_preview',
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(content),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (showCancel) ...[
                NeoButton.small(
                  id: 'cancel_button',
                  label: cancelLabel ?? 'Cancel',
                  onPressed: () {},
                  backgroundColor: AppColors.gray200,
                  textColor: AppColors.gray800,
                ),
                SizedBox(width: 8),
              ],
              NeoButton.small(
                id: 'confirm_button',
                label: confirmLabel,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Prevent instantiation
  const AlertExamples._();
}
