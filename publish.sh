#!/bin/sh

flutter build web --web-renderer=html
cp -a build/web/. docs/