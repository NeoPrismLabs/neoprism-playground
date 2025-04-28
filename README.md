# NeoPrism Playground

A component playground for showcasing and embedding NeoPrism UI library components in documentation sites.

## Overview

NeoPrism Playground is a Flutter web application designed to render isolated NeoPrism UI components that can be embedded in documentation via iframes. This allows component previews to be displayed directly within documentation pages, providing interactive examples of the NeoPrism design system.

## URL Structure

```
http://playground.neoprismlabs.in/#/[component]?style=[style-variant]&theme=[light|dark]
```

### Parameters

- **component**: The component type to display (e.g., button, alert, badge)
- **style**: The style variant of the component
- **theme**: Either 'light' or 'dark' (defaults to 'light')

## Embedding in Documentation

You can embed these components in your documentation site using iframes:

```html
<iframe 
  src="https://neoprism-playground.com/#/button?style=icon&theme=light"
  style="width: 100%; height: 100px; border: 1px solid #eaeaea; border-radius: 8px;"
  loading="lazy">
</iframe>
```

## Available Components

### Buttons

`/button?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default button with standard styling | `/button?style=standard` |
| `icon` | Button with an icon and text label | `/button?style=icon` |
| `compressed` | Compact button with reduced padding | `/button?style=compressed` |
| `small` | Small-sized button | `/button?style=small` |
| `large` | Large-sized button with increased padding | `/button?style=large` |
| `custom` | Custom styled button with decorative elements | `/button?style=custom` |
| `disabled` | Disabled state button | `/button?style=disabled` |

### Alerts

`/alert?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default information alert with confirm/cancel | `/alert?style=standard` |
| `destructive` | Error-styled alert for critical actions | `/alert?style=destructive` |
| `custom` | Custom styled alert with unique colors | `/alert?style=custom` |
| `simple` | Simplified alert with only a confirm button | `/alert?style=simple` |
| `longContent` | Alert with longer text content | `/alert?style=longContent` |

### Badges

`/badge?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default badge with label | `/badge?style=standard` |
| `status` | Status indicator badge (active, pending, etc.) | `/badge?style=status` |
| `counter` | Numeric counter badge for notifications | `/badge?style=counter` |
| `dot` | Simple dot indicator without text | `/badge?style=dot` |
| `custom` | Multiple badges displayed together | `/badge?style=custom` |

### Inputs

`/input?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default input field with label | `/input?style=standard` |
| `password` | Password field with obscured text | `/input?style=password` |
| `multiline` | Multi-line text input area | `/input?style=multiline` |
| `small` | Compact input field | `/input?style=small` |
| `error` | Input with validation error state | `/input?style=error` |
| `disabled` | Disabled input field | `/input?style=disabled` |
| `prefix` | Input with a prefix icon | `/input?style=prefix` |

### Checkboxes

`/checkbox?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default checkbox with label | `/checkbox?style=standard` |
| `custom` | Custom colored checkbox | `/checkbox?style=custom` |
| `disabled` | Disabled checkbox | `/checkbox?style=disabled` |
| `label_left` | Checkbox with label positioned on left | `/checkbox?style=label_left` |
| `large` | Large-sized checkbox | `/checkbox?style=large` |
| `custom_label` | Checkbox with custom widget label | `/checkbox?style=custom_label` |
| `standalone` | Checkbox without label | `/checkbox?style=standalone` |

### Cards

`/card?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default card with content | `/card?style=standard` |
| `custom` | Custom styled card with unique colors | `/card?style=custom` |
| `interactive` | Tappable card with hover effects | `/card?style=interactive` |
| `media` | Card with media content area | `/card?style=media` |

### Toggles

`/toggle?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default toggle switch | `/toggle?style=standard` |
| `custom` | Custom colored toggle | `/toggle?style=custom` |
| `large` | Large-sized toggle | `/toggle?style=large` |
| `label_left` | Toggle with label on left side | `/toggle?style=label_left` |
| `disabled` | Disabled toggle | `/toggle?style=disabled` |
| `custom_label` | Toggle with custom widget label | `/toggle?style=custom_label` |
| `settings` | Toggle in a settings-like layout | `/toggle?style=settings` |

### Dropdowns

`/dropdown?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default dropdown selector | `/dropdown?style=standard` |
| `icons` | Dropdown with item icons | `/dropdown?style=icons` |
| `custom` | Custom styled dropdown | `/dropdown?style=custom` |
| `disabled` | Disabled dropdown | `/dropdown?style=disabled` |

### Sliders

`/slider?style=[variant]&theme=[light|dark]`

| Style | Description | Example URL |
|-------|-------------|-------------|
| `standard` | Default continuous slider | `/slider?style=standard` |
| `discrete` | Slider with discrete step values | `/slider?style=discrete` |
| `custom` | Custom styled slider with color feedback | `/slider?style=custom` |
| `disabled` | Disabled slider | `/slider?style=disabled` |

## Development

### Project Structure

```
lib/
├── main.dart                     # Entry point 
├── app.dart                      # App configuration
├── theme/
│   ├── app_colors.dart           # Color constants
│   └── theme_provider.dart       # Theme configuration
├── components/                   # Component examples
│   ├── button_examples.dart
│   ├── alert_examples.dart
│   ├── badge_examples.dart
│   ├── input_examples.dart
│   ├── checkbox_examples.dart
│   ├── card_examples.dart
│   ├── toggle_examples.dart
│   ├── dropdown_examples.dart
│   └── slider_examples.dart
├── routing/
│   └── router.dart               # Router configuration
└── widgets/
    └── component_wrapper.dart    # The wrapper widget
```

### Running the Project

1. Ensure Flutter is installed and configured for web development
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run -d chrome` to start the application

### Building for Production

```bash
flutter build web --web-renderer canvaskit --release
```

## License

This project is part of the NeoPrism UI library. See the LICENSE file for details.