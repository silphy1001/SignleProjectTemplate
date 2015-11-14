#################################
# Config
#################################
TARGET=sample_exe

BIN_DIR=./bin
SRC_DIR=./src
INC_DIR=./inc

SRCS=$(filter $(SRC_DIR)/main.c, $(wildcard $(SRC_DIR)/*.c))
SRCS+=$(filter-out $(SRC_DIR)/main.c, $(wildcard $(SRC_DIR)/*.c))
OBJS=$(SRCS:.c=.o)

LDFLAGS=
CFLAGS=-g -Wall
INCLUDES=-I$(INC_DIR)

.PHONY: all clean install

all: $(TARGET)

$(TARGET): $(OBJS)
	@echo $(CC) $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o $(TARGET) $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o $(TARGET) $(OBJS)

install: $(TARGET)
	@mv $(TARGET) $(BIN_DIR)/

$(OBJS): $(SRCS)
	@echo $(OBJS) $(SRCS)
	@echo $(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $(@:.o=.c)
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $(@:.o=.c)

clean:
	$(RM) $(TARGET) $(BIN_DIR)/$(TARGET) $(OBJS)


#################################
# References
#################################

## サブディレクトリをmakeする綺麗な方法
# http://cyocho.blog109.fc2.com/blog-entry-52.html

