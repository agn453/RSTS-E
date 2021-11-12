$! Command file to build SCMPCA.B2S (with Basic-Plus-2)
$!
$ set noOn
$ run $bp2ic2
SCALE 0
OLD SCMPCA.B2S
COMPILE SCMPCA/OBJECT/CHAIN/NODEBUG/NOCROSS/NOLIST/NOWARN
BUILD SCMPCA
SCRATCH
EXIT
$ tkb @SCMPCA
$ del scmpca.odl, scmpca.obj, scmpca.cmd
$ exit
