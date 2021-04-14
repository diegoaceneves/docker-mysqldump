FROM debian:10.9-slim
RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-client-10.3 bzip2  -y

ENV DB_NAME="mysql"
ENV DB_USER="root"
ENV DB_PASS="pass"
ENV DB_HOST="localhost"

WORKDIR /backup

CMD /usr/bin/mysqldump -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME > $DB_NAME.sql.bz2
