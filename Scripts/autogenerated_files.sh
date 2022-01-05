#!/bin/sh

GENERATED_DIR="./Stolovka/Generated"
mkdir -p $GENERATED_DIR
touch "${GENERATED_DIR}/Strings+Generated.swift"
touch "${GENERATED_DIR}/XCAssets+Generated.swift"

swiftgen config run --config swiftgen.yml
