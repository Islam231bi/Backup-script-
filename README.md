# Backup-script-
Backup script using Bash and Make to backup certain directory.
___________________________________________________________
## Usage:
1 - Clone the repo.<br>
2 - you can use the script in two ways: (using make directly or runnning the bash script).<br>
  a - `$ make ARG1="[absolute path to dir you want to backup]" ARG2="backupdir/" ARG3="[Interval-sec]" ARG4="[Max-backups]"`<br>
  b - First run `$ chmod +x backupd.sh` <br>
      then run `$ ./backupd.sh [absolute path to dir you want to backup] backupdir/ [interval-sec] [max-backups]`<br>
3 - Try to make a change in the specified directory and open backupdir to see the backup directory with modification date.<br>
4 - You can open 'changes_made.txt' file to see change history.<br>
