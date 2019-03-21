Build:

Needed SW
- Linux or Unix, maybe some unix-like enviroment (MinGW etc.)
- System progs date, cut, grep, make, expr, bash compatible shell
- genisoimage
- Macroassembler AS [http://john.ccac.rwth-aachen.de:8000/as/] (version 1.42 at
  least, not tested with version 1.41rX)
- Small utility bin2tap [https://sourceforge.net/projects/zxspectrumutils/]

Type 'make' and build should be done automatically. For each a80 file tap file
should be generated. One generated iso file should contain all tap files.

All generated files can be deleted with "make clean".

If you want programs with alternate IDE ports (MB02 IDE) use 'make dron'
instead 'make'.

How to transfer tap files into Speccy is your bussines, but simplest way should
be take iso file and use it in DEMFIR
[https://github.com/z00m128/demfir].

