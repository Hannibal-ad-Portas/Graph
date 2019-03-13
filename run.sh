#!/bin/sh

# This script runs the processing script in the folder it is run in

# Get the name of the current working directory
# This should be the same as the 'main' file otherwise the sketch will nor compile
SCRIPT="${PWD##*/}"

# Move into the parent directoy
cd ..

processing-java --sketch="$SCRIPT" --run
