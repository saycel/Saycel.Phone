#! /bin/bash
mysql -u root -p$MYSQL_ROOT_PASSWORD -h mysql << EOF
update mysql.user set host='%' and password='password($DBRWPW)' where host='mysql' and user="$DBRWUSER";
flush privileges;
grant all on $DBNAME.* to "$DBRWUSER"@'%';
update mysql.user set host='%' password='password($DBROPW)' where host='mysql' and user="$DBROUSER";
flush privileges;
grant usage on $DBNAME.* to "$DBROUSER"@'%';
grant select on $DBNAME.* to "$DBROUSER"@'%';
flush privileges;
EOF
