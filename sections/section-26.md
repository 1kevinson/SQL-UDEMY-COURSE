## Before all, install nodejs 
___

[Node js download link(FR)](https://nodejs.org/fr/)

The project is to create migration files for database social_db
for table comments.

### Create a database in MySQL
___
Run the command to install 
```sql
CREATE DATABASE IF NOT EXISTS social_db;
```

Change MySQL Authentication mode
```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '77azerty';

FLUSH PRIVILEGES;
```

### Create folder for migration project 
___
Run the command to install 
```
$ mkdir migration-project
```

Move into the new folder
```
$ cd migration-project
```

### Create package.json file 
___
Run the command to generate package.json file 
```
$ npm install
```

Verify that the package.json is correctly generated
```
$ ls -l
```

### Install db-migrate package
___
Install db-migrate
```
$ sudo npm install -g db-migrate db-migrate-mysql
```

Check db-migrate is correctly installed
```
$ db-migrate
```

### Database configuration
___
Create a database.json config file in project root
```
$ touch database.json
```

configure the file
```json
{
    "dev": {
        "host": "localhost",
        "user": "root",
        "password" : "77azerty",
        "database": "social_db",
        "driver": "mysql",
        "multipleStatements": true
      }
}
```

### In the package.json file, make change on
___
```json
"scripts": {
    "migrate": "db-migrate"
  }
```

Run the following command in the project folder, this will generate a new migration file in a new migrations folder.
```
$ npm run migrate create table-comments
```

In the migration file generated configure the migration process
```js
exports.up = function(db) {
  return db.createTable('comments', {
    columns: {
      id: { 
        type: 'int',
        primaryKey: true,
        notNull: true,
        autoIncrement: true
      },
      createdAt: {
        type: 'timestamp',
        notNull: true
      },
      updatedAt:  {
        type: 'timestamp',
        notNull: true
      },
      content:  {
        type: 'string',
        notNull: true,
        length: 255
      }
    },
    ifNotExists: true
  });
};

exports.down = function(db) {
  return db.dropTable('comments');
};
```

Then run migration command to apply migration
```
$ npm run migrate up
```

Then run migration command to undo migration
```
$ npm run migrate down
```

### Create a second migration file
___
Then run migration command to undo migration
```
$ npm run migrate create rename-content-to-comment_content
```

In the second migration file generated configure the migration process
```js
exports.up = function(db) {
  // db.renameColumn('tableName', 'oldColumnName', 'newColumnName');
  return db.renameColumn('comments', 'content', 'comment_content');
};

exports.down = function(db) {
  return db.renameColumn('comments', 'comment_content', 'content');
};
```

In mysql check the changes
```sql
SHOW tables;

DESC comments;
```