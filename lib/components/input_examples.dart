import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';
import '../theme/app_colors.dart';

class InputExamples {
  static Widget build(String style, String theme) {
    switch (style) {
      case 'password':
        return NeoInput(
          id: 'password',
          labelText: 'Password',
          obscureText: true,
          suffixIcon: Icon(Icons.visibility),
          hintText: 'Enter your password',
          helperText: 'Password should be at least 8 characters',
        );
      case 'multiline':
        return NeoInput(
          id: 'message',
          labelText: 'Message',
          maxLines: 3,
          hintText: 'Type your message here',
          helperText: 'Share your thoughts with us',
          size: NeoInputSize.large,
          backgroundColor: AppColors.gray100,
        );
      case 'small':
        return NeoInput(
          id: 'small_input',
          labelText: 'Small Input',
          size: NeoInputSize.small,
          hintText: 'Compact input field',
        );
      case 'error':
        return NeoInput(
          id: 'error_input',
          labelText: 'Email Address',
          hintText: 'Enter your email',
          errorText: 'Please enter a valid email address',
          prefixIcon: Icon(Icons.email),
        );
      case 'disabled':
        return NeoInput(
          id: 'disabled_input',
          labelText: 'Disabled Input',
          hintText: 'This field is disabled',
          enabled: false,
        );
      case 'prefix':
        return NeoInput(
          id: 'email_field',
          labelText: 'Email Address',
          hintText: 'you@example.com',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email),
        );
      default:
        return NeoInput(
          id: 'standard_input',
          labelText: 'Username',
          hintText: 'Enter your username',
          helperText: 'Your username will be visible to others',
        );
    }
  }

  // Prevent instantiation
  const InputExamples._();
}
