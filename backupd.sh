#!/bin/bash

# Backup script to a certain directory in a backup directory every specified time interval

### Command line args ###

dir=$1
backupdir=$2
interval=$3
max=$4


cnt=$( ls $backupdir | wc -l)

