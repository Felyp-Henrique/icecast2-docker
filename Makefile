IMAGE_VERSION = "2.1.0"

all: clean build

clean:
	rm -fr bin

build:
	sudo docker image build -t icecast2:v${IMAGE_VERSION} .