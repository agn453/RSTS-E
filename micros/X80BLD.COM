$! Command file to build X80.B2S (with Basic-Plus-2)
$!
$ set noOn
$ run $bp2ic2
SCALE 0
OLD X80.B2S
COMPILE X80/OBJECT/CHAIN/NODEBUG/NOCROSS/NOLIST/NOWARN
BUILD X80
SCRATCH
EXIT
$ tkb @X80
$ del x80.odl, x80.obj, x80.cmd
$ exit
