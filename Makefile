ifndef GL_PROJECT
$(error Please first load the development environment.)
endif

TARGET = app

.PHONY: all
all: pre-build $(TARGET)


.PHONY: pre-build
pre-build:
	@test -d ${GL_PROJECT_BUILD_DIR} || mkdir -p $$_
	@test -d ${GL_PROJECT_SRC_BUILD_DIR} || mkdir -p $$_


.PHONY: $(TARGET)
$(TARGET):
	bear --output ${GL_PROJECT_BUILD_DIR}/compile_commands.json -- $(MAKE) -C $(GL_PROJECT_SRC_DIR)
	

.PHONY: clean
clean:
	$(RM) -f $(GL_PROJECT_SRC_BUILD_DIR)/$(TARGET) *.o


.PHONY: clean-deps
clean-deps:
	$(RM) -rf ${GL_PROJECT_EXT_BUILD_DIR}


.PHONY: clean-all
clean-all:
	$(RM) -rf $(GL_PROJECT_BUILD_DIR)
