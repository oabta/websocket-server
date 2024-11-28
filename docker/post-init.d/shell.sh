#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# Loop through all input files passed via stdin
read -r -a custom_init_scripts <<< "$@"
failure=0
if [[ "${#custom_init_scripts[@]}" -gt 0 ]]; then
    for custom_init_script in "${custom_init_scripts[@]}"; do
        [[ "$custom_init_script" != *".sh" ]] && continue
        if [[ -x "$custom_init_script" ]]; then
            echo "Executing ${custom_init_script}"
            "$custom_init_script" || failure="1"
        else
            echo "Sourcing ${custom_init_script} as it is not executable by the current user, any error may cause initialization to fail". "$custom_init_script"
        fi
        [[ "$failure" -ne 0 ]] && echo "Failed to execute ${custom_init_script}"
    done
fi

exit "$failure"
