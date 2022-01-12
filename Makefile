TOOL_ICEGEN_FOLDER = "./tools/icegen"
TOOL_ICEGEN_BIN = "${TOOL_ICEGEN_FOLDER}/icegen"

all: clear build

clear:
	@rm -r bin || true
	@rm -r ${TOOL_ICEGEN_FOLDER}/target || true

build:
	@mkdir bin
	@cd ${TOOL_ICEGEN_FOLDER} && go get && go build
	@cp ${TOOL_ICEGEN_BIN} ./bin
	docker image build -t icecast2:v3.0.0