server:
	-apache2ctl stop
	php -S localhost:8080
pull-db:
	wget https://db.projecteq.net/api/v1/dump/archive/peq-1709370023.zip
	unzip peq-1709370023.zip
	rm peq-1709370023.zip
	mysql -u root -pmariadb -h 127.0.0.1 -e "DROP DATABASE IF EXISTS peq; CREATE DATABASE peq;"
	cd peq-dump && mysql -u root -pmariadb -h 127.0.0.1 peq < create_all_tables.sql
	rm -rf peq-dump/
