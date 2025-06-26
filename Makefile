postgres:
	docker run --name postgres16 -e POSTGRES_PASSWORD=secret -e POSTGRES_USER=root -p 30034:5432 -d postgres:16

createdb:
	docker exec -it postgres16 createdb --username=root --owner=root simplebank

dropdb:
	docker exec -it postgres16 dropdb simplebank

migrateup:
	 migrate -path db/migration -database "postgresql://root:secret@localhost:30034/simplebank?sslmode=disable" -verbose up

migratedown:
	 migrate -path db/migration -database "postgresql://root:secret@localhost:30034/simplebank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc