include makefile.env
export

build:
	docker build -t $(REPOSITORY):$(TAG) .

push: 
	docker push $(REPOSITORY):$(TAG)
