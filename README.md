# the_splendid_market

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.





# the_splendid_market

Bring your business online for free

## Deploying


flutter clean
flutter pub get

flutter build web --base-href /the-splendid-market/ --release

cd build/web
git init
git add .
git commit -m "Deploy 2"
git remote add origin https://github.com/Progress7Clarkkent77/the-splendid-market.git
git push -u --force origin main


