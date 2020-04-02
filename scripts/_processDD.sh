#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-1.0.4-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache
set -e

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	JAVA -jar $tooling -ProcessAcceleratorKit -s=Core -pts=./input/datadictionary/DD.xlsx -dep=Master-1.0 -op=..
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		JAVA -jar $tooling -ProcessAcceleratorKit -s=Core -pts=./input/datadictionary/DD.xlsx -dep=Master-1.0 -op=..
	else
		echo ProcessAcceloratorKit NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
