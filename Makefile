build:
	docker build -t gpodder-server ./gpodder-server
run: build
	if [ ! -d ./data ]; then mkdir ./data; fi
	docker run \
		--name gpodder-server \
		-v ./data:/var/www/html \
		--hostname gpodder.example.org \
		-p 80:8080 gpodder-server
aws: build
	docker tag gpodder-server:latest 634617747016.dkr.ecr.eu-central-1.amazonaws.com/gpodder-server:latest
	docker push 634617747016.dkr.ecr.eu-central-1.amazonaws.com/gpodder-server:latest
