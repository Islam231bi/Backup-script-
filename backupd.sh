#!/bin/bash

# Backup script to a certain directory in a backup directory every specified time interval

echo "Welcome to Backup script"
echo "CTRL^C to terminate"

### Validation ###
if [ $# -ne 4 ]
then
  echo "please provide correct number of arguments"
  exit
fi

### Command line args ###

dir=$1
backupdir=$2
interval=$3
max=$4

### Validation ###
if [[ ! "$interval" =~ ^[0-9]+$ ]]
then
  echo "Please provide a number for the time interval"
  exit
fi

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


while [ 1 ]
do
     sleep $interval

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

	 cnt=$((cnt + 1))
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
done

