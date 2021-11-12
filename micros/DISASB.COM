$! Command file to build DISASM.B2S (with Basic-Plus-2)
$!
$ set noOn
$ run $bp2ic2
SCALE 0
OLD DISASM.B2S
COMPILE DISASM/OBJECT/CHAIN/NODEBUG/NOCROSS/NOLIST/NOWARN
BUILD DISASM
SCRATCH
EXIT
$ tkb @DISASM
$ del disasm.odl, disasm.obj, disasm.cmd
$ exit
