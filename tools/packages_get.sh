#!/usr/bin/env bash

function sync() {
  for d in */; do
    cd $d
    pubspec="pubspec.yaml"
    if [ -f "$pubspec" ]; then
      if grep -q flutter: "$pubspec"; then
        echo "find flutter module $d"
        flutter packages get
      else
         echo "find dart module $d"
        dart pub get
      fi
    fi
    cd ..
  done
}

cd ..
sync
cd feature/
for d in */; do
  cd "${d}"
  sync
  cd ..
done
