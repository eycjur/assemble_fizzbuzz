
target := fizzbuzz
all: tmp/${target}.bin
	./tmp/${target}.bin

tmp/${target}.bin: tmp/${target}.o
	ld -e main -o tmp/${target}.bin tmp/${target}.o

tmp/${target}.o: ${target}.s
	gcc ${target}.s -c -o tmp/${target}.o

# Cで比較用に作成
sample: tmp/sample.o
	./tmp/sample.o

tmp/sample.o: sample.c
	gcc sample.c -o tmp/sample.o -static

assemble: sample.c
	gcc sample.c -S -o tmp/sample.s
	less tmp/sample.s

diassemble: tmp/sample.o
	objdump -D tmp/sample.o > tmp/sample_reverse.s
	less tmp/sample_reverse.s
