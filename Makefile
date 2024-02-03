run:
	docker build -t auth_service .
	docker run --rm -d -p 1323:1323 auth_service

buildl:
	GOOS=linux GOARCH=amd64 go build -o service ./main.go

buildw:
	go build -o service ./main.go

copy:
	scp service root@188.124.39.138:

#docker buildx build --no-cache --platform linux/amd64 -t <REPO>/serverx:v0.0.1 .
#docker login -u <UNAME> -p <PASS> <REPO>
#docker push <REPO>/serverx:v0.0.1

docker_build:
	docker buildx build --no-cache --platform linux/amd64 -t cr.selcloud.ru/zeitment-registry/serverx:v0.0.1 .
	docker login -u token -p CRgAAAAAi65I2Uhv8HzwPW9089RCyMahb93OjOZ2 cr.selcloud.ru/zeitment-registry
	docker push cr.selcloud.ru/zeitment-registry/serverx:v0.0.1