# Clerk Flutter Deployment Sample

A sample Flutter application demonstrating how to integrate and deploy a Flutter app with Clerk authentication, using environment-based configuration management.

## Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- iOS development setup (for iOS deployment)
- Android development setup (for Android deployment)
- A Clerk account and application setup at [clerk.dev](https://clerk.dev)

## Setup

1. Clone the repository:
```bash
git clone https://github.com/justinwilloughby/clerk_flutter_deployment_sample.git
cd clerk_flutter_deployment_sample
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure your Clerk keys:

The project uses configuration files to manage environment-specific Clerk keys. There are two config files:

- `config/app_config.development.json` - Development configuration
- `config/app_config.production.json` - Production configuration

Make sure to update these files with your Clerk publishable keys:

```json
{
    "clerkPublishableKey": "your_clerk_key_here"
}
```

See `config/app_config.example.json` for an example.

## Running the App

### Development

Run the app in development mode:

```bash
flutter run --dart-define-from-file=config/app_config.json
```

### Production

Run the app in production mode:

```bash
flutter run --release --dart-define-from-file=config/app_config.production.json
```

### Building for Release

For iOS:
```bash
flutter build ios --release --dart-define-from-file=config/app_config.production.json
```

For Android:
```bash
flutter build apk --release --dart-define-from-file=config/app_config.production.json
```

## Project Structure

- `lib/main.dart` - Main application entry point with Clerk configuration
- `config/` - Environment-specific configuration files
  - `app_config.development.json` - Development configuration
  - `app_config.production.json` - Production configuration

## Security Notes

- Never commit your production Clerk keys to version control
- Keep your `app_config.production.json` file in `.gitignore`
- Always use `pk_live_` keys for production and `pk_test_` keys for development

## Contributing

Feel free to submit issues and enhancement requests!
