# Before all create backup folder

In your terminal go to home dir
```
$ cd /var
```

### Create backup folder for database
___
Run the command to create backups folder
```
$ sudo mkdir mysql_backups
```

change rights on folder
```
$ sudo chown 1kevinson:staff mysql_backups
```

install mysql 8 cli
```
$ brew install mysql
```

add mysql 8 to PATH Variable
```bash
export PATH=$PATH:/usr/local/Cellar/mysql/8.0.23_1/bin  
```

In the backup folder, create script for database saving 
```
$ mkdir cron
$ cd cron
$ touch cron_db_backup.sh
$ sudo chmod 777 cron_db_backup.sh
```

In the script file add the following script
```bash

```