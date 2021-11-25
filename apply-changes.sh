#!/bin/sh
# usage: ./apply-changes.sh <target-dir>
# apply the changes found herein to the corpus found in target-dir.
# The default for <target-dir> is "../corpus"

CORPUSROOT=${1:-"../corpus"}
echo "INFO: copying to $CORPUSROOT." 1>&2
if [ ! -d "$CORPUSROOT" ]; then
	echo "ERROR: target directory $CORPUSROOT does not exist!" 1>&2
	exit 1
fi
for dir in 20*; do
	if [ ! -d "$CORPUSROOT/$dir" ]; then
		echo "ERROR: video directory $CORPUSROOT/$dir does not exist!" 1>&2
		exit 2
	fi
	[ ! -e "$CORPUSROOT/$dir/$dir" ] && echo "WARNING: transcript file $CORPUSROOT/$dir/$dir does not exist." 1>&2
	echo cp --backup $dir/$dir $CORPUSROOT/$dir/$dir # keep a backup with suffix ~
done
