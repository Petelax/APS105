# Makefile for APS105 compilation and exercises
# Written by Peter Xiong, 2026.
# 
# Builds all c files in working directory into an executable with the same name.
# Also runs exercises according to file name.

.PHONY: build exercise run clean

CC := gcc
FLAGS := -Wall -Wextra -lm

SRC := $(wildcard *.c)
TARGET := $(basename $(firstword $(SRC)))

LAB := $(word 1,$(subst part, ,$(subst lab,,$(TARGET))))

build: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(SRC) $(FLAGS) -o $(TARGET)

run: build
	./$(TARGET)

exercise: build
	~aps105i/public/exercise $(LAB) $(TARGET)

clean:
	rm -f $(TARGET)
