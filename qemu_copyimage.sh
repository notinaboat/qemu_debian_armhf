#!/bin/bash

set -e
IMAGE=debian.qcow2

if [ $# -lt 1 ]; then
    echo "Usage: $0 file" >&2
    echo "  where file is the non-versioned file within /boot of $IMAGE" >&2
    echo "   initrd.img or vmlinuz for example" >&2 
    exit 1
fi

which virt-ls >/dev/null 2>&1
which virt-copy-out >/dev/null 2>&1

COPYTO=$1
GREPFOR=$(basename $COPYTO)

set +e
BOOTFILE=$(virt-ls -a $IMAGE /boot/ | grep $GREPFOR | grep -- "-")
set -e
if [ -z "$BOOTFILE" ]; then
    echo "Not found, please choose non-versioned entry from:" >&2
    virt-ls -a $IMAGE /boot/ >&2
    exit 1
fi
virt-copy-out -a $IMAGE /boot/$BOOTFILE .
