#!/bin/bash
make -C ./buildroot distclean
rm -rf ./buildroot/output
rm -f ./buildroot/.config


echo "Clean complete: Buildroot state reset."
