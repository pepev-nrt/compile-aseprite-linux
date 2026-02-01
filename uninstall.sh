#!/bin/bash

[[ -z "${XDG_DATA_HOME}" ]] && XDG_DATA_HOME="${HOME}/.local/share"

INSTALL_DIR="${XDG_DATA_HOME}/aseprite"
BINARY_DIR="${HOME}/.local/bin"
LAUNCHER_DIR="${XDG_DATA_HOME}/applications"

SIGNATURE_FILE="${INSTALL_DIR}/compile-aseprite-linux"
BINARY_FILE="${BINARY_DIR}/aseprite"
LAUNCHER_FILE="${LAUNCHER_DIR}/aseprite.desktop"
ICON_FILE="${INSTALL_DIR}/data/icons/ase256.png"

if [[ -f "${SIGNATURE_FILE}" ]] ; then
    read -e -p "Aseprite installed. Do you want to remove it? (y/N): " choice
    [[ "${choice}" == [Yy]* ]] \
        || exit 0
else
    echo "Aseprite was not installed with aseprite-compile-linux as '${SIGNATURE_FILE}' is not present. Aborting." \
        && exit 0
fi

rm "${BINARY_FILE}" \
    || { echo "Unable to remove '${BINARY_FILE}'." >&2 ; exit 1 ; }
rm "${LAUNCHER_FILE}" \
    || { echo "Unable to remove '${LAUNCHER_FILE}'." >&2 ; exit 1 ; }
rm -r "${INSTALL_DIR}" \
    || { echo "Unable to remove '${INSTALL_DIR}'." >&2 ; exit 1 ; }

echo "Aseprite uninstalled successfully! Your configuration, themes, or installed templates in ~/.config/aseprite will not be deleted."
