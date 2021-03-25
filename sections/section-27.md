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

In the backup folder, create script for databases dumps 
```
$ mkdir cron
$ cd cron
$ touch cron_db_backup.sh
$ sudo chmod 777 cron_db_backup.sh
```

### Create a script file
___
In the script file add the following script
```bash
#!/bin/bash

DATE=$(date +"%Y%m%d")

BACKUP_DIR="/var/mysql_backups/dailys"

MYSQL_USER="root"
MYSQL_PASSWORD="77azerty"

MYSQL=mysql
MYSQLDUMP=mysqldump

SKIPDATABASES="Database|information_schema|performance_schema|mysql|sys"

RETENTION_DAYS=7

mkdir -p $BACKUP_DIR/$DATE

databases=`$MYSQL -u$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "($SKIPDATABASES)"`

for db in $databases; do
echo $db
$MYSQLDUMP --force --opt --user=$MYSQL_USER --password=$MYSQL_PASSWORD --skip-lock-tables --events --databases $db | gzip > "$BACKUP_DIR/$DATE/$db.sql.gz"
done

find $BACKUP_DIR/* -mtime +$RETENTION_DAYS -delete
```

add cron in cronlist
```
$ crontab -e 
```
```vim
0 15 18 1/1 * ? * /var/mysql_backups/cron/cron_db_backup.sh 
```