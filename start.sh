#! /bin/bash
echo -e "\n ===== start =======  \n"
#docker-compose rm -sf
docker-compose up -d
echo -e "\n ===== status ======  \n"
docker-compose ps
