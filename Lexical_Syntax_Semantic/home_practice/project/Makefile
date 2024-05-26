


SRCDIR := src
OBJDIR := lib
BINDIR := build
INCDIR := include

OBJS := $(OBJDIR)/main.o $(OBJDIR)/factorial.o

TARGET := $(BINDIR)/out.exe

main: $(OBJS)
	gcc $(OBJS) -o $(TARGET)

$(OBJDIR)/main.o: $(SRCDIR)/main.c | $(OBJDIR)
	gcc -c -o $@ $< -I./$(INCDIR)

$(OBJDIR)/factorial.o: $(SRCDIR)/factorial.c | $(OBJDIR)
	gcc -c -o $@ $< -I./$(INCDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

.PHONY: clean
clean:
	rm -f $(OBJDIR)/* $(BINDIR)/*
run:
	$(TARGET)