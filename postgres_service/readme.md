#
docker build -t my-postgres-image .                 

docker run -it -p 5432:5432 my-postgres-image:latest

In case missing permissions error is present, set permissions by using 

chmod 755 data/*    

Setup connection (credentials from Dockerfile)

Ready to query