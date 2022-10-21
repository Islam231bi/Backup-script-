# Cron Job
Cron is a job scheduling utility present in Unix like systems. The crond daemon enables cron functionality and runs in background. The cron reads the crontab (cron tables) for running predefined scripts.<br>



## Run Locally

List all the cron jobs for the current user

```bash
  crontab -l
```

Make cron-backupd.sh executable

```bash
  chmod +x cron-backupd.sh
```

Edit crontab entries 

```bash
  crontab -e
```

Add this line at the end of crontab file

```bash
*/1 * * * * [Absolute path to cron-backupd.sh] [Absolute path to desired directory to backup] [Absolute path to backup dir] [max_backups]

```

To observe the job listed in crontab file

```bash
  crontab -l
```
Now the job is executing every one minute.
