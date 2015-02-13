# Freeradius bash admin
-----------------------

A collection of bash scripts to admin the MySQL database backend of the freeradius server. 

# Commands

## radius-user

```
Usage: radius-user <options>

-> Admin the user databases.

Options:

  add                       : Add a user.
  show <username> or <all>  : Show a user.
  update <username>         : Update a user.
  password <username>       : Update the users' password.
  delete <username>         : Delete a user.
  help                      : Display help topics.
```

## radius-nas

```
Usage: radius-nas <options>

-> Admin network access server (Access points).

Options:

  add                 : Add a NAS.
  show <id> or <all>  : Show a NAS.
  update <id>         : Update a NAS.
  delete <id>         : Delete NAS by ID.
  help                : Display help topics.
```

## radius-export

```
Usage: radius-export <path> <file-name> or <options>

-> Export a MySQL dump file. By default the dump file is saved to '$EXPORT_DIRECTORY'.

Options:

  help
```

## radius-import
```
Usage: radius-import <dump-file.sql.gz>

-> Import a MySQL dump file. 
```

## radius-clean

```
Usage: radius-clean <options>

-> Clean some MySQL-Tables.

Options:

  radpostauth    : Clean 'radpostauth' table.
```

# Table layout
  
## Table 'nas'

```
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(10)      | NO   | PRI | NULL    | auto_increment |
| nasname     | varchar(128) | NO   |     | NULL    |                |
| shortname   | varchar(32)  | NO   |     | NULL    |                |
| type        | varchar(30)  | YES  |     | NULL    |                |
| ports       | int(11)      | YES  |     | NULL    |                |
| secret      | varchar(60)  | NO   |     | NULL    |                |
| community   | varchar(50)  | YES  |     | NULL    |                |
| description | varchar(200) | YES  |     | NULL    |                |
| server      | varchar(50)  | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
```
  
## Table 'radacct'

```
+----------------------+-------------+------+-----+---------+----------------+
| Field                | Type        | Null | Key | Default | Extra          |
+----------------------+-------------+------+-----+---------+----------------+
| radacctid            | bigint(21)  | NO   | PRI | NULL    | auto_increment |
| acctsessionid        | varchar(64) | NO   | MUL |         |                |
| acctuniqueid         | varchar(32) | NO   | MUL |         |                |
| username             | varchar(64) | NO   | MUL |         |                |
| groupname            | varchar(64) | NO   |     |         |                |
| realm                | varchar(64) | YES  |     |         |                |
| nasipaddress         | varchar(15) | NO   | MUL |         |                |
| nasportid            | varchar(15) | YES  |     | NULL    |                |
| nasporttype          | varchar(32) | YES  |     | NULL    |                |
| acctstarttime        | datetime    | YES  | MUL | NULL    |                |
| acctstoptime         | datetime    | YES  | MUL | NULL    |                |
| acctsessiontime      | int(12)     | YES  | MUL | NULL    |                |
| acctauthentic        | varchar(32) | YES  |     | NULL    |                |
| connectinfo_start    | varchar(50) | YES  |     | NULL    |                |
| connectinfo_stop     | varchar(50) | YES  |     | NULL    |                |
| acctinputoctets      | bigint(20)  | YES  |     | NULL    |                |
| acctoutputoctets     | bigint(20)  | YES  |     | NULL    |                |
| calledstationid      | varchar(50) | NO   |     |         |                |
| callingstationid     | varchar(50) | NO   |     |         |                |
| acctterminatecause   | varchar(32) | NO   |     |         |                |
| servicetype          | varchar(32) | YES  |     | NULL    |                |
| framedprotocol       | varchar(32) | YES  |     | NULL    |                |
| framedipaddress      | varchar(15) | NO   | MUL |         |                |
| acctstartdelay       | int(12)     | YES  |     | NULL    |                |
| acctstopdelay        | int(12)     | YES  |     | NULL    |                |
| xascendsessionsvrkey | varchar(10) | YES  |     | NULL    |                |
+----------------------+-------------+------+-----+---------+----------------+
```
  
## Table 'radcheck'

```
+-----------+------------------+------+-----+---------+----------------+
| Field     | Type             | Null | Key | Default | Extra          |
+-----------+------------------+------+-----+---------+----------------+
| id        | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| username  | varchar(64)      | NO   | MUL |         |                |
| attribute | varchar(64)      | NO   |     |         |                |
| op        | char(2)          | NO   |     | ==      |                |
| value     | varchar(253)     | NO   |     |         |                |
+-----------+------------------+------+-----+---------+----------------+
```
  
## Table 'radgroupcheck'

```
+-----------+------------------+------+-----+---------+----------------+
| Field     | Type             | Null | Key | Default | Extra          |
+-----------+------------------+------+-----+---------+----------------+
| id        | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| groupname | varchar(64)      | NO   | MUL |         |                |
| attribute | varchar(64)      | NO   |     |         |                |
| op        | char(2)          | NO   |     | ==      |                |
| value     | varchar(253)     | NO   |     |         |                |
+-----------+------------------+------+-----+---------+----------------+
```
  
## Table 'radgroupreply'

```
+-----------+------------------+------+-----+---------+----------------+
| Field     | Type             | Null | Key | Default | Extra          |
+-----------+------------------+------+-----+---------+----------------+
| id        | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| groupname | varchar(64)      | NO   | MUL |         |                |
| attribute | varchar(64)      | NO   |     |         |                |
| op        | char(2)          | NO   |     | =       |                |
| value     | varchar(253)     | NO   |     |         |                |
+-----------+------------------+------+-----+---------+----------------+
```
  
## Table 'radpostauth'

```
+----------+-------------+------+-----+-------------------+-----------------------------+
| Field    | Type        | Null | Key | Default           | Extra                       |
+----------+-------------+------+-----+-------------------+-----------------------------+
| id       | int(11)     | NO   | PRI | NULL              | auto_increment              |
| username | varchar(64) | NO   |     |                   |                             |
| pass     | varchar(64) | NO   |     |                   |                             |
| reply    | varchar(32) | NO   |     |                   |                             |
| authdate | timestamp   | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
| nasip    | varchar(45) | YES  |     | NULL              |                             |
+----------+-------------+------+-----+-------------------+-----------------------------+
```
  
## Table 'radreply'

```
+-----------+------------------+------+-----+---------+----------------+
| Field     | Type             | Null | Key | Default | Extra          |
+-----------+------------------+------+-----+---------+----------------+
| id        | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| username  | varchar(64)      | NO   | MUL |         |                |
| attribute | varchar(64)      | NO   |     |         |                |
| op        | char(2)          | NO   |     | =       |                |
| value     | varchar(253)     | NO   |     |         |                |
+-----------+------------------+------+-----+---------+----------------+
```
  
## Table 'radusergroup'

```
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| username  | varchar(64) | NO   | MUL |         |       |
| groupname | varchar(64) | NO   |     |         |       |
| priority  | int(11)     | NO   |     | 1       |       |
+-----------+-------------+------+-----+---------+-------+
```
