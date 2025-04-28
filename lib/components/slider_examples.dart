import 'package:flutter/material.dart';
import 'package:neoprism_core/neoprism_core.dart';

class SliderExamples {
  static Widget build(String style, String theme) {
    final ValueNotifier<double> volumeNotifier = ValueNotifier<double>(50.0);
    final ValueNotifier<double> opacityNotifier = ValueNotifier<double>(0.7);
    final ValueNotifier<double> temperatureNotifier =
        ValueNotifier<double>(22.5);

    Color getTemperatureColor(double temp) {
      if (temp < 20) return Colors.blue;
      if (temp < 22) return Colors.teal;
      if (temp < 24) return Colors.green;
      if (temp < 26) return Colors.orange;
      return Colors.red;
    }

    switch (style) {
      case 'discrete':
        return ValueListenableBuilder<double>(
          valueListenable: opacityNotifier,
          builder: (context, opacityValue, child) {
            return NeoSlider(
              id: 'opacity_slider',
              value: opacityValue,
              min: 0,
              max: 1,
              divisions: 10,
              onChanged: (value) {
                opacityNotifier.value = value;
              },
              label: 'Opacity',
              valueFormat: (value) => '${(value * 100).round()}%',
              showMinMaxLabels: true,
            );
          },
        );

      case 'custom':
        return ValueListenableBuilder<double>(
          valueListenable: temperatureNotifier,
          builder: (context, temperatureValue, child) {
            return NeoSlider(
              id: 'temperature_slider',
              value: temperatureValue,
              min: 16,
              max: 30,
              divisions: 14,
              onChanged: (value) {
                temperatureNotifier.value = value;
              },
              label: 'Temperature',
              valueFormat: (value) => '${value.toStringAsFixed(1)}°C',
              activeTrackColor: getTemperatureColor(temperatureValue),
              trackColor: Colors.grey[200],
              thumbColor: Colors.white,
              size: NeoSliderSize.large,
              showMinMaxLabels: true,
              showTicks: true,
            );
          },
        );

      case 'disabled':
        return NeoSlider(
          id: 'disabled_slider',
          value: 35,
          min: 0,
          max: 100,
          label: 'Disabled Slider',
          enabled: false,
        );

      default:
        return ValueListenableBuilder<double>(
          valueListenable: volumeNotifier,
          builder: (context, volumeValue, child) {
            return NeoSlider(
              id: 'volume_slider',
              value: volumeValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                volumeNotifier.value = value;
              },
              label: 'Volume',
              valueFormat: (value) => '${value.round()}%',
            );
          },
        );
    }
  }

  // Prevent instantiation
  const SliderExamples._();
}
