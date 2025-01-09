#!/bin/sh

flutter clean
flutter build web --release
cp -a build/web/. docs/