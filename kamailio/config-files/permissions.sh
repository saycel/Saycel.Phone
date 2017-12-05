#! /bin/bash
mysql -u root -p$MYSQL_ROOT_PASSWORD -h mysql << EOF
update mysql.user set host='%' where host='mysql' and user='kamailio';
flush privileges;
grant all on kamailio.* to 'kamailio'@'%';
update mysql.user set host='%' where host='mysql' and user='kamailioro';
flush privileges;
grant usage on kamailio.* to 'kamailioro'@'%';
grant select on kamailio.* to 'kamailioro'@'%';
flush privileges;
EOF
