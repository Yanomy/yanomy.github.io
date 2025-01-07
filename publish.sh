#!/bin/sh

flutter build web --release --web-renderer=html
cp -a build/web/. docs/