$! Command file to build INTEL.B2S (with Basic-Plus-2)
$!
$ set noOn
$ run $bp2ic2
SCALE 0
OLD INTEL.B2S
COMPILE INTEL/OBJECT/CHAIN/NODEBUG/NOCROSS/NOLIST/NOWARN
BUILD INTEL
SCRATCH
EXIT
$ tkb @INTEL
$ del intel.odl, intel.obj, intel.cmd
$ exit
