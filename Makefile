run:
	docker build -t auth_service .
	docker run --rm -d -p 1323:1323 auth_service