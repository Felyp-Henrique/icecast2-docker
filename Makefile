IMAGE_VERSION = "2.1.0"
TOOL_ICEGEN_FOLDER = "./tools/icegen"
TOOL_ICEGEN_BIN = "${TOOL_ICEGEN_FOLDER}/icegen"
TOOL_ICEGEN_TEMPLATES = "${TOOL_ICEGEN_FOLDER}/templates"

all: clear build

clear:
	@rm -r bin || true

build:
	@mkdir bin
	@cd ${TOOL_ICEGEN_FOLDER} && make
	@chmod +x ${TOOL_ICEGEN_BIN}
	@mv ${TOOL_ICEGEN_BIN} ./bin
	sudo docker image build -t icecast2:v${IMAGE_VERSION} .