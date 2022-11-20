all: 0000 0100 0200 0300-franklin 0300-usci
	cat 0000 0100 0200 0300-franklin > franklin.bin
	cat 0000 0100 0200 0300-usci > usci.bin

0300-franklin:
	xa -o 0300-franklin 0300.s

0300-usci:
	xa -DUSCI -o 0300-usci 0300.s

clean:
	rm -f franklin.bin usci.bin 0300-franklin 0300-usci
