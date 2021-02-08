CCFLAGS=-g -DMAIN
SOURCE=int2byte.c checksum.c

all: int2byte checksum

test: int2byte checksum
	cat 156.txt | int2byte | checksum
	cat 229.txt | int2byte | checksum
	cat 81.txt  | int2byte | checksum

int2byte: int2byte.c

checksum: checksum.o

checksum.o: checksum.c checksum.h
	$(CC) -o checksum.o -c $(CCFLAGS) checksum.c

checksum.i: checksum.c checksum.h
	$(CC) -o checksum.i -E checksum.c

checksum.s: checksum.c checksum.h
	$(CC) -o checksum.s -S checksum.c

checksum.x86: tube.s
	ln -s cheksum.x86 checksum.s checksum.x86

checksum.mips: checksum.o
	echo "Go to the website: http://reliant.colab.duke.edu/c2mips/"
	echo "enter the file checksum.c"
	touch checksum.mips

clean:
	rm -f checksum checksum.o checksum.i checksum.s checksum.x86
	rm -f *~ \#*



