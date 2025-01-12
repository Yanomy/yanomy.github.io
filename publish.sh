#!/bin/sh

flutter clean
dart run build_runner build --delete-conflicting-outputs
flutter build web --release --pwa-strategy=none
cp -a build/web/. docs/