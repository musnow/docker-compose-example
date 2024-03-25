#!/bin/sh
backup_local_dir=/root/docker
backup_remote_webdav_host=${backup_remote_host}
backup_remote_dir=/home/web_backups/
backup_tmp_file_dir=/root/backups
PUSH_FILE="${backup_tmp_file_dir}/backup_$(date +%Y%m%d_%H).tgz.gz"

AUTH_INFO=${AUTH_INFO}
if [ ! -d "$backup_tmp_file_dir" ]; then
  mkdir -p "$backup_tmp_file_dir"
fi
tar zcvf ${PUSH_FILE} ${backup_local_dir}
curl -u ${AUTH_INFO} -T ${PUSH_FILE} ${backup_remote_webdav_host}${backup_remote_dir}

rm -f ${PUSH_FILE}
cd ${backup_local_dir} && docker-compose up --build -d