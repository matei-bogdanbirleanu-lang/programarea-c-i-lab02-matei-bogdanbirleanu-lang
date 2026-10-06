CC := clang
WARNINGS := -Wall -Wextra -Wpedantic -Wconversion -Wshadow -Wformat=2
CFLAGS := -std=c23 -g3 -O1 $(WARNINGS)
SANFLAGS := -fsanitize=address,undefined -fno-omit-frame-pointer

PROGRAM := bicycle-tariff

.PHONY: all run test sanitize clean

all: $(PROGRAM)

$(PROGRAM): src/main.c
	$(CC) $(CFLAGS) -o $@ $<

run: $(PROGRAM)
	./$(PROGRAM)

test: $(PROGRAM) tests/public.sh
	./tests/public.sh ./$(PROGRAM)

sanitize: src/main.c tests/public.sh
	$(CC) $(CFLAGS) $(SANFLAGS) -o $(PROGRAM)-sanitize src/main.c
	ASAN_OPTIONS=detect_leaks=1 ./tests/public.sh ./$(PROGRAM)-sanitize

clean:
	rm -f $(PROGRAM) $(PROGRAM)-sanitize
