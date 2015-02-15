# Freeradius bash admin
-----------------------

A collection of bash scripts to admin the MySQL database backend of the freeradius server. 

# Commands

## radius-user

```
Usage: radius-user <options>

-> Manage the freeradius users.

Options:

  add                       : Add a user.
  show <username> or <all>  : Show a specific user or all users.
  update <username>         : Update a user.
  password <username>       : Update the users' password.
  delete <username>         : Delete a user.
  help                      : Show this help message.
```

## radius-nas

```
Usage: radius-nas <options>

-> Manage the network access server (Access points).

Options:

  add                 : Add a NAS.
  show <id> or <all>  : Show a NAS.
  update <id>         : Update a NAS.
  delete <id>         : Delete a NAS by ID.
  help                : Show this help topic.
```

## radius-group

```
Usage: radius-group <option>

-> Manage the groups.

Options:

  add                        : Add a group.
  prepopulate                : Prepopulate the group table.
  show <groupname> or <all>  : Show a specific group or all groups.
  update <groupname>         : Update a group.
  delete <groupname>         : Delete a group.
  help                       : Show this help message.

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

## radius-install

```
Usage: radius-install [-d] <table>

-> Install the MySQL tables.

Options:

  -d : Drop all existing tables.

Tables:

  all    (infouser, infogroup, nas, radacct, radcheck, radgroupcheck, radgroupreply,
          radreply, radusergroup, radpostauth, cui, ippool, wimax)
  common (infouser, infogroup, nas, radacct, radcheck, radgroupcheck, radgroupreply,
          radreply, radusergroup, radpostauth)
  infouser
  infogroup
  nas
  radacct
  radcheck
  radgroupcheck
  radgroupreply
  radreply
  radusergroup
  radpostauth
  cui
  ippool
  wimax
```

## radius-uninstall

```
Usage: radius-uninstall <table>

-> Uninstall specific or all MySQL tables.

Tables:

  all    (infouser, infogroup, nas, radacct, radcheck, radgroupcheck, radgroupreply,
          radreply, radusergroup, radpostauth, cui, ippool, wimax)
  common (infouser, infogroup, nas, radacct, radcheck, radgroupcheck, radgroupreply,
          radreply, radusergroup, radpostauth)
  infouser
  infogroup
  nas
  radacct
  radcheck
  radgroupcheck
  radgroupreply
  radreply
  radusergroup
  radpostauth
  cui
  ippool
  wimax
```

# Table layout

## Default freeradius tables.
  
### Table 'nas'

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
  
### Table 'radacct'

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
  
### Table 'radcheck'

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
  
### Table 'radgroupcheck'

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
  
### Table 'radgroupreply'

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

### Table 'radreply'

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
  
### Table 'radusergroup'

```
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| username  | varchar(64) | NO   | MUL |         |       |
| groupname | varchar(64) | NO   |     |         |       |
| priority  | int(11)     | NO   |     | 1       |       |
+-----------+-------------+------+-----+---------+-------+
```

### Table 'radpostauth'

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

### Table 'cui'

```
+------------------+-------------+------+-----+---------------------+-------+
| Field            | Type        | Null | Key | Default             | Extra |
+------------------+-------------+------+-----+---------------------+-------+
| clientipaddress  | varchar(15) | NO   | PRI |                     |       |
| callingstationid | varchar(50) | NO   | PRI |                     |       |
| username         | varchar(64) | NO   | PRI |                     |       |
| cui              | varchar(32) | NO   |     |                     |       |
| creationdate     | timestamp   | NO   |     | CURRENT_TIMESTAMP   |       |
| lastaccounting   | timestamp   | NO   |     | 0000-00-00 00:00:00 |       |
+------------------+-------------+------+-----+---------------------+-------+
```

### Table 'ippool'

```
+------------------+------------------+------+-----+---------+----------------+
| Field            | Type             | Null | Key | Default | Extra          |
+------------------+------------------+------+-----+---------+----------------+
| id               | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| pool_name        | varchar(30)      | NO   | MUL | NULL    |                |
| framedipaddress  | varchar(15)      | NO   | MUL |         |                |
| nasipaddress     | varchar(15)      | NO   | MUL |         |                |
| calledstationid  | varchar(30)      | NO   |     | NULL    |                |
| callingstationid | varchar(30)      | NO   |     | NULL    |                |
| expiry_time      | datetime         | YES  |     | NULL    |                |
| username         | varchar(64)      | NO   |     |         |                |
| pool_key         | varchar(30)      | NO   |     | NULL    |                |
+------------------+------------------+------+-----+---------+----------------+
```

### Table 'wimax'

```
+----------+--------------+------+-----+-------------------+-----------------------------+
| Field    | Type         | Null | Key | Default           | Extra                       |
+----------+--------------+------+-----+-------------------+-----------------------------+
| id       | int(11)      | NO   | PRI | NULL              | auto_increment              |
| username | varchar(64)  | NO   | MUL |                   |                             |
| authdate | timestamp    | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
| spi      | varchar(16)  | NO   | MUL |                   |                             |
| mipkey   | varchar(400) | NO   |     |                   |                             |
| lifetime | int(12)      | YES  |     | NULL              |                             |
+----------+--------------+------+-----+-------------------+-----------------------------+
```

## Custom tables

### Table 'infouser'

```
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| firstname   | varchar(128) | YES  |     | NULL    |                |
| lastname    | varchar(128) | YES  |     | NULL    |                |
| description | longtext     | YES  |     | NULL    |                |
| username    | varchar(128) | YES  | UNI | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
```

### Table 'infogroup'

```
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(10)      | NO   | PRI | NULL    | auto_increment |
| groupname   | varchar(64)  | NO   | UNI |         |                |
| title       | varchar(128) | NO   |     |         |                |
| description | varchar(200) | NO   |     |         |                |
| weight      | int(10)      | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
```
