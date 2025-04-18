# Makefile for hello example
CFLAGS := -Wall -g
all: hello
hello: hello.c
clean:
	rm -f hello
.PHONY: all clean
