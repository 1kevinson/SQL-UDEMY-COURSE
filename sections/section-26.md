## Before all, install nodejs 

[Node js download link(FR)](https://nodejs.org/fr/)

The project is to create migration files for database social_db
for table comments.

### Create a database in MySQL
Run the command to install 
```sql
CREATE DATABASE IF NOT EXISTS social_db;
```

### Create folder for migration project 

Run the command to install 
```
$ mkdir migration-project
```

Move into the new folder
```
$ cd migration-project
```

### Create package.json file 

Run the command to generate package.json file 
```
$ npm install
```

Verify that npm is correctly installed
```
$ ls -l
```

### Install db-migrate package

Install db-migrate
```
$ sudo npm install -g db-migrate
```

Check db-migrate is correctly installed
```
$ db-migrate
```

### Database configuration

Create a database.json config file in project root
```
$ touch database.json
```

configure the file
```json
"dev": {
    "driver": "sqlite3",
    "filename": "~/dev.db"
  },
```

### In the package.json file, make change on

```json
"scripts": {
    "migrate": "db-migrate"
  }
```

Run the following command in the project folder, this will generate a new migration file in a new migrations folder.
```
$ npm run migrate create table-comments
```
