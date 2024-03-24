build:
	docker build -t micro-gpodder-server ./micro-gpodder-server
run: build
	if [ ! -d ./data ]; then mkdir ./data; fi
	docker run \
		--name micro-gpodder-server \
		-v ./data:/var/www/server/data \
		--hostname gpodder.example.org \
		-p 8080:8080 micro-gpodder-server
aws: build
	docker tag micro-gpodder-server:latest 634617747016.dkr.ecr.eu-central-1.amazonaws.com/micro-gpodder-server:latest
	docker push 634617747016.dkr.ecr.eu-central-1.amazonaws.com/micro-gpodder-server:latest
