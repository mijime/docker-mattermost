# docker-mattermost

Example
===

Create a mysql container.

`docker run --name=some-mysql --env="MYSQL_DATABASE=mattermost" --env="MYSQL_ROOT_PASSWORD=ch4ngeIt0" --detach mysql`

Create a mattermost container, and link the mysql container.

`docker run --link=some-mysql:mysql --publish=8080:80 --detach mijime/mattermost`

If you want to connect to an existing database...

```
docker run --detach --publish=8080:80 \
  --env SQL_DATA_SOURCE="exists-user:exists-passsword@tcp(exists-dbhost:3306)/exists-dbname?charset=utf8mb4,utf8" \
  mijime/mattermost
```

Change the part `exists-*`.

If you want to change the file storage to s3...

```
docker run --detach --publish=8080:80 \
  --link=some-mysql:mysql \
  --env FILE_DRIVER_NAME=amazons3 \
  --env FILE_AMAZON_S3_ACCESS_KEY_ID=AKI1234567890EXAMPLE \
  --env FILE_AMAZON_S3_SECRET_ACCESS_KEY=secretAccessKey1234 \
  --env FILE_AMAZON_S3_REGION=ap-northeast-1 \
  --env FILE_AMAZON_S3_BUCKET=your-s3-bucket-names \
  mijime/mattermost
```

See.

[`Use MySQL`](examples/use-mysql)
[`Use Postgres`](examples/use-postgres)
[`Use SSL`](examples/use-ssl)

Variable
===

See.

[`Template file`](assets/runtime/config.json.tmpl)
[`Enviroment Name Rule`](scripts/convert-json.awk)

### ServiceSettings

