TARGET = 
SOURCE_DIR = sources
SOURCES = $(SOURCE_DIR)/containers.c $(SOURCE_DIR)/robotControl.c $(SOURCE_DIR)/visibilityGraph.c $(SOURCE_DIR)/stack.c $(SOURCE_DIR)/graham.c
OBJS = $(SOURCES:.c=.o)
CC = gcc
CFLAGS = -Wall -Werror -std=gnu99
BASE_HEADERS = $(SOURCE_DIR)/stdclibs.h
PREFIX =
C_LIB_DIR =
C_LIB = -lm

INCLUDE_DIR = 
TEST_SOURCES = $(SOURCES)
TEST_OBJS = $(TEST_SOURCES:.c=.o)
TEST_EXEC_NAME = 

all: test clean

%.o:  %.c %.h $(BASE_HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(C_LIB) $^ -o $@
	rm -f $(SOURCE_DIR)/*.o

clean: 
	rm -f $(TARGET) $(OBJS) $(TEST_OBJS)

test: $(TEST_OBJS)
	$(CC)  $^ -o $@ $(C_LIB)

.PHONY: clean all
