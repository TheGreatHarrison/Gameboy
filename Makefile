# Makefile

# Compiler
CXX = g++

# Compiler flags
# CFLAGS = -Wextra -pedantic -std=c11 -I/opt/homebrew/Cellar/sdl2/2.28.1/include/SDL2 -I/opt/homebrew/Cellar/sdl2_ttf/2.20.2/include/ -I./inc/
CXXFLAGS = -std=c++17 -Wall -Wextra -Iinclude

# LDFLAGS = -L/opt/homebrew/Cellar/sdl2/2.28.1/lib -L/opt/homebrew/Cellar/sdl2_ttf/2.20.2/lib -lSDL2 -lSDL2_ttf

# Directories
SRCDIR = src
BUILDDIR = build
TARGET = bin/gameboy

# Files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))

# Build target
all: $(TARGET)

# Link
$(TARGET): $(OBJECTS)
	@mkdir -p $(dir $@)
	$(CXX) $(OBJECTS) -o $@

# Compile
$(BUILDDIR)/%.o: $(SRCDIR)/%.cppcd

	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean
clean:
	rm -rf $(BUILDDIR) $(TARGET)

.PHONY: all clean
