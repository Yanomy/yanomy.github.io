#!/bin/sh

flutter build web --release
cp -a build/web/. docs/