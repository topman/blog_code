# coding: utf-8

import redis
import pymongo
import sqlite3
import MySQLdb

from time import time

BITS = 8
COUNT = 10000
DB = "benchmark"
TABLE = "nosql"

MYSQL_USER = "root"
MYSQL_PW = "zhutao"

class Database(object):
    def __init__(self, dbname=""):
        self.dbname = dbname
        self.conn = None

    def test_write(self):
        start = time()
        value = "1" * BITS
        for i in range(COUNT):
            self.write(str(i), value)
        end = time()
        print "writing %d records to %s costs %s seconds" % (COUNT, self.dbname, str(end-start))
        self.clean()

    def init_for_read(self):
        value = "1" * BITS
        for i in range(COUNT):
            self.write(str(i), value)

    def test_read(self):
        self.init_for_read()
        start = time()
        value = "1" * BITS
        for i in range(COUNT):
            self.read(str(i))
        end = time()
        print "reading %d records to %s costs %s seconds" % (COUNT, self.dbname, str(end-start))
        self.clean()

    def write(self):
        raise NotImplementedError("Need to implement in child class")

    def read(self):
        raise NotImplementedError("Need to implement in child class")

    def clean(self):
        pass

class Mongo(Database):
    def __init__(self, dbname=""):
        super(Mongo, self).__init__("Mongo")
        self.conn = getattr(pymongo.Connection()[DB], TABLE)

    def write(self, key, value):
        self.conn.insert({ "key" : key, "value" : value })

    def read(self, key):
        self.conn.find({"key" : key})

    def clean(self):
        self.conn.remove()
    
        
class Redis(Database):
    def __init__(self, dbname=""):
        super(Redis, self).__init__("Redis")
        self.conn = redis.Redis()

    def write(self, key, value):
        self.conn.append(key, value)

    def read(self, key):
        self.conn.get(key)

    def clean(self):
        self.conn.flushall()

class Sqlite(Database):
    def __init__(self, dbname="", use_mem=False):
        super(Sqlite, self).__init__("Sqlite")
        if use_mem:
            db = sqlite3.connect(":memory:")
        else:
            db = sqlite3.connect("%s.db" % DB)
        self.db = db
        self.conn = db.cursor()
        self.conn.execute("create table %s (key text, value text)" % TABLE)

    def write(self, key, value):
        query = "insert into %s values('%s', '%s')" % (TABLE, key, value)
        self.conn.execute(query)

    def read(self, key):
        query = "select * from %s where key='%s'" % (TABLE, key)
        self.conn.execute(query)

    def clean(self):
        self.conn.execute("drop table %s" % TABLE)
        self.db.close()
        
class Mysql(Database):
    def __init__(self, dbname=""):
        super(Mysql, self).__init__("Mysql")
        self.db = MySQLdb.connect(user=MYSQL_USER, passwd=MYSQL_PW, db=DB)
        self.conn = self.db.cursor()

    def write(self, key, value):
        query = "insert into %s values('%s', '%s')" % (TABLE, key, value)
        self.conn.execute(query)

    def read(self, key):
        query = "select * from %s where `key`='%s'" % (TABLE, key)
        self.conn.execute(query)

    def clean(self):
        self.conn.execute("delete from %s" % TABLE)
        self.db.close()


if __name__ == "__main__":
    Redis().test_read()
    Mongo().test_read()
    Sqlite().test_read()
    Sqlite(use_mem=True).test_read()
    Mysql().test_read()
