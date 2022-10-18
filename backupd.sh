#!/bin/bash

# Backup script to a certain directory in a backup directory every specified time interval

### Command line args ###

dir=$1
backupdir=$2
interval=$3
max=$4

# Files count in the backup dir
cnt=$( ls $backupdir | wc -l)

# Date and time information
date=$(date +%F)
hour=$(date +%H)
min=$(date +%M)
sec=$(date +%S)


if [ $cnt -lt $max ]                                                                                                 
then 
  cp -R $dir $backupdir$date"-"$hour"-"$min"-"$sec
  cnt=$((cnt+1))
else
  file=($backupdir/*)
  rm -rf $file
  cp -R $dir $backupdir$date"-"$hour"-"$min"-"$sec
fi

# Creating necessary files
ls -lr $dir > directory-info.last
touch  directory-info.new
> changes_made.txt






