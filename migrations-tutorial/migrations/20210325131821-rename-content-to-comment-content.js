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
  // db.renameColumn('tableName', 'oldColumnName', 'newColumnName');
  return db.renameColumn('comments', 'content', 'comment_content');
};

exports.down = function(db) {
  return db.renameColumn('comments', 'comment_content', 'content');
};

exports._meta = {
  "version": 1
};
