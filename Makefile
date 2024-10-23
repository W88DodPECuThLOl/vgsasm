CPP = g++
CPPFLAGS = -std=c++17 -g
HEADERS = src/common.h
OBJECTS = \
	main.o \
	file.o \
	prep.o \
	label.o \
	formulas.o \
	struct.o \
	macro.o \
	mnemonic.o 

all: vgsasm

check: vgsasm
	./vgsasm -o all.bin test/all.asm
	z88dk.z88dk-dis all.bin >test/all_disassemble.asm
	diff test/all_expect.asm test/all_disassemble.asm

update:
	cp test/all_disassemble.asm test/all_expect.asm

clean:
	rm -f ${OBJECTS}
	rm -f vgsasm

vgsasm: ${OBJECTS}
	${CPP} ${CPPFLAGS} -o vgsasm ${OBJECTS}

macro.o: src/macro.cpp ${HEADERS} src/mnemonic.h
	${CPP} ${CPPFLAGS} -c $< -o $@

file.o: src/file.cpp ${HEADERS} src/sha1.hpp src/mnemonic.h
	${CPP} ${CPPFLAGS} -c $< -o $@

formulas.o: src/formulas.cpp ${HEADERS}
	${CPP} ${CPPFLAGS} -c $< -o $@

label.o: src/label.cpp ${HEADERS} src/mnemonic.h
	${CPP} ${CPPFLAGS} -c $< -o $@

mnemonic.o: src/mnemonic.cpp ${HEADERS} src/mnemonic.h src/mnemonic_*.hpp
	${CPP} ${CPPFLAGS} -c $< -o $@

struct.o: src/struct.cpp ${HEADERS}
	${CPP} ${CPPFLAGS} -c $< -o $@

prep.o: src/prep.cpp ${HEADERS}
	${CPP} ${CPPFLAGS} -c $< -o $@

main.o: src/main.cpp ${HEADERS}
	${CPP} ${CPPFLAGS} -c $< -o $@
