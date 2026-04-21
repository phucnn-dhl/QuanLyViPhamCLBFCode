SHELL := cmd
.SHELLFLAGS := /C

CC := gcc
CFLAGS := -std=c17 -Wall -Wextra -Iinclude
SRCDIR := src
INCDIR := include
BUILDDIR := build
BINDIR := bin
TARGET := $(BINDIR)/fcode-trainc
SRCS := $(wildcard $(SRCDIR)/*.c)
HDRS := $(wildcard $(INCDIR)/*.h)
OBJS := $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SRCS))
FORMAT_FILES := $(strip $(SRCS) $(HDRS))

.PHONY: all clean format tidy

all: $(TARGET)

$(TARGET): $(OBJS)
	@if not exist $(BINDIR) mkdir $(BINDIR)
	$(CC) $(OBJS) -o $@

$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@if not exist $(BUILDDIR) mkdir $(BUILDDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@if exist $(BUILDDIR) rmdir /S /Q $(BUILDDIR)
	@if exist $(BINDIR) rmdir /S /Q $(BINDIR)

format:
ifndef FORMAT_FILES
	@echo "No source or header files found to format."
else
	clang-format -i $(FORMAT_FILES)
endif

tidy:
ifndef SRCS
	@echo "No source files found to analyze."
else
	clang-tidy $(SRCS) -- -std=c17 -Iinclude
endif
