-include ${GL_PROJECT_MAKE_DIR}/rules.mk

CXXFLAGS += `pkg-config --cflags glfw3`
ifeq ($(EXTERNAL_GLFW_BUILD_TYPE), Shared)
	LDLIBS = `pkg-config --libs-only-l glfw3`
	LDFLAGS = `pkg-config --libs-only-L glfw3`
else
	LDLIBS = `pkg-config --libs-only-l --static glfw3`
	LDFLAGS = `pkg-config --libs-only-L --static glfw3`
endif

$(GL_PROJECT_SRC_BUILD_DIR)/app: main.cpp
	@echo
	@echo '[CFLAGS] ->>>>>' `pkg-config --cflags glfw3`
	@echo '[LDLIBS] ->>>>>' `pkg-config --libs-only-l glfw3`
	@echo '[LDFLAG] ->>>>>' `pkg-config --libs-only-L glfw3`
	@echo
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) $(LDLIBS) -o $@
