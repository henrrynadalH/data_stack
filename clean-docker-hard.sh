docker-compose down
docker volume rm $(docker volume ls -q)
docker rmi $(docker images -a  -q)
docker rm $(docker ps --filter=status=exited --filter=status=created -q)