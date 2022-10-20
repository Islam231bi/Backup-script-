#!/bin/bash

# Backup script to a certain directory in a backup directory every specified time interval

echo "Welcome to Backup script"
echo "CTRL^C to terminate"

### Validation ###
if [ $# -ne 3 ]
then
  echo "please provide correct number of arguments"
  exit
fi

### Command line args ###

dir=$1
backupdir=$2
max=$3

### Validation ###

if [[ ! "$max" =~ ^[0-9]+$ ]]
then
  echo "Please provide a number for the max backups"
  exit
fi

# Files count in the backup dir
cnt=$( ls $backupdir | wc -l)

# Date and time information
date=$(date +%F)
hour=$(date +%H)
min=$(date +%M)
sec=$(date +%S)



# Creating necessary files
if [ ! -f "directory-info.last" ]
then
  touch "directory-info.last"
fi
#ls -lr $dir > directory-info.last
> changes_made.txt



# Modification info for the dir
ls -lr $dir > directory-info.new

# Determine if changes made to directory and redirecting changes to a file
diff directory-info.last directory-info.new >> changes_made.txt

if [ $? -eq 1 ]
then
  if [ $cnt -lt $max ]
  then
    date=$(date +%F)
    hour=$(date +%H)
    min=$(date +%M)
    sec=$(date +%S)

    cp -R $dir $backupdir$date"-"$hour"-"$min"-"$sec
    cnt=$( ls $backupdir | wc -l)
  else
    files=($backupdir/*)
    rm -rf $files
    date=$(date +%F)
    hour=$(date +%H)
    min=$(date +%M)
    sec=$(date +%S)
    cp -R $dir $backupdir$date"-"$hour"-"$min"-"$sec
  fi
  cp directory-info.new directory-info.last
fi

