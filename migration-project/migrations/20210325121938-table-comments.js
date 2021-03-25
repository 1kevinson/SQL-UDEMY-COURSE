'use strict';

var dbm;
var type;
var seed;

/**
  * We receive the dbmigrate dependency from dbmigrate initially.
  * This enables us to not have to rely on NODE_PATH.
  */
exports.setup = function(options, seedLink) {
  dbm = options.dbmigrate;
  type = dbm.dataType;
  seed = seedLink;
};

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

exports._meta = {
  "version": 1
};
