#!/bin/sh

flutter clean
dart run build_runner build --delete-conflicting-outputs
flutter build web --release
cp -a build/web/. docs/