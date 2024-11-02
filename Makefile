# Define the compiler
CC = gcc

# Define the compiler flags
CFLAGS = -Wall -Wextra -I$(SRC_DIR)

# Define the directories
SRC_DIR = src
EXAMPLE_DIR = example
OBJ_DIR = obj
ARCHIVE_DIR = archive
BIN_DIR = bin

# Define the source files
SRC_FILES = $(SRC_DIR)/logger.c
EXAMPLE_FILES = $(EXAMPLE_DIR)/main.c

# Define the output files
LIBRARY = $(ARCHIVE_DIR)/liblogger.a
OBJECT = $(OBJ_DIR)/logger.o
EXAMPLE = $(BIN_DIR)/example

# Define the targets
all: directories $(LIBRARY) $(EXAMPLE)

directories:
	mkdir -p $(OBJ_DIR) $(ARCHIVE_DIR) $(BIN_DIR)

$(LIBRARY): $(OBJECT)
	ar rcs $(LIBRARY) $(OBJECT)

$(OBJECT): $(SRC_FILES)
	$(CC) $(CFLAGS) -c $(SRC_FILES) -o $(OBJECT)

$(EXAMPLE): $(EXAMPLE_FILES) $(LIBRARY)
	$(CC) $(CFLAGS) -o $(EXAMPLE) $(EXAMPLE_FILES) -L$(ARCHIVE_DIR) -llogger

run: $(EXAMPLE)
	./$(EXAMPLE)

clean:
	rm -f $(OBJ_DIR)/*.o $(ARCHIVE_DIR)/*.a $(BIN_DIR)/*

.PHONY: all clean directories
