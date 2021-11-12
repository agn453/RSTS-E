$! Command file to build X65.B2S (with Basic-Plus-2)
$!
$ set noOn
$ run $bp2ic2
SCALE 0
OLD X65.B2S
COMPILE X65/OBJECT/CHAIN/NODEBUG/NOCROSS/NOLIST/NOWARN
BUILD X65
SCRATCH
EXIT
$ tkb @X65
$ del x65.odl, x65.obj, x65.cmd
$ exit
