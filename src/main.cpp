#include <GLFW/glfw3.h>
#include <iostream>

namespace {
    constexpr auto winHeight{ 480 };
    constexpr auto winWidth{ 640 };
    constexpr auto winTitle{ "OpenGL Window" };
} // namespace

int main()
{
    GLFWwindow* window = nullptr;

    if (!glfwInit())
        return GLFW_NOT_INITIALIZED;

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
#ifdef __APPLE__
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
#endif

    window = glfwCreateWindow(winWidth, winHeight, winTitle, nullptr, nullptr);
    if (!window) {
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);

    while (!glfwWindowShouldClose(window)) {
        glfwSwapBuffers(window);
        glfwPollEvents();
    }


    glfwTerminate();

    return 0;
}
