#!/bin/sh

MODULES=(
	"SharedResources"
	)

MODULES_FOLDER="./Stolovka/Packages"

for MODULE in "${MODULES[@]}"; do
	MODULE_DIR="${MODULES_FOLDER}/${MODULE}"
	mkdir -p "${MODULE_DIR}/Sources/${MODULE}/Generated"
	swiftgen config run --config "${MODULE_DIR}/swiftgen.yml"
done

touch StolovkaTests/Mock/AutoMockable.generated.swift