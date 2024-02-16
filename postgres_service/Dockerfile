# Use the official PostgreSQL image as the base
FROM postgres:latest

# Environment variables to configure the database
ENV POSTGRES_DB=dvdrental_
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=mypassword

# Copy the restore.sql file into the container
COPY restore.sql /docker-entrypoint-initdb.d/restore.sql

# Create a directory to store .dat files
RUN mkdir -p /data

# Copy the .dat files into the container
COPY data/* /data/

# Expose the PostgreSQL port
EXPOSE 5432

# Command to run when the container starts (PostgreSQL will execute restore.sql)
CMD ["postgres"]