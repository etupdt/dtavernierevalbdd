
mysqldump --user=service --password=pa$$w0rd --lock-tables --databases cinema > /data/backup/cinema_$(date +%Y-%m-%d).sql
