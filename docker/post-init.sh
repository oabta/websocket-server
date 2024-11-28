#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail


# Only execute init scripts once
if [[ ! -f ".initialized" && -d "entrypoint-init.d" ]]; then
    read -r -a init_scripts <<< "$(find "entrypoint-init.d" -type f -print0 | sort -z | xargs -0)"
    if [[ "${#init_scripts[@]}" -gt 0 ]] && [[ ! -f ".initialized" ]]; then
        for init_script in "${init_scripts[@]}"; do
            for init_script_type_handler in ./post-init.d/*.sh; do
                "$init_script_type_handler" "$init_script"
            done
        done
    fi

    touch ".initialized"
fi
