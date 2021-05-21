#!/bin/bash

# Make sure the project directory argument is provided.
if [[ $# -ne 1 ]]; then
    echo "Usage: desync-build <projectdir>"
    exit 2
fi

# Perform setup.
. $(dirname "$0")/desync-setup.sh $1

# Clean the project.
make -j $(nproc) "CC=$CC_WRAPPER" clean

# Compile the project (run make) using the wrapper.
make -j $(nproc) "CC=$CC_WRAPPER" || exit

# Done.
echo "Desync build done"