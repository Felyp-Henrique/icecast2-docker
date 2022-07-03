IMAGE_VERSION = "2.2.0"

all: clean build

clean:
	rm -fr builds
	rm -fr icegen-v0.1.1-beta.zip
	sudo docker image rm icecast2:v${IMAGE_VERSION} || true

build:
	wget https://github.com/Felyp-Henrique/icegen/releases/download/v0.1.1-beta/icegen-v0.1.1-beta.zip
	mkdir builds
	mv icegen-v0.1.1-beta.zip builds
	cd builds && unzip icegen-v0.1.1-beta.zip && rm icegen-v0.1.1-beta.zip
	cd ..
	sudo docker image build -t icecast2:v${IMAGE_VERSION} .

publish:
	sudo docker tag icecast2:v${IMAGE_VERSION} perl19/icecast2:v${IMAGE_VERSION}
	sudo docker push perl19/icecast2:v${IMAGE_VERSION}

latest:
	sudo docker tag icecast2:v${IMAGE_VERSION} perl19/icecast2:latest
	sudo docker push perl19/icecast2:latest