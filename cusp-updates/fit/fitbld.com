$! Build FIT.TSK from Y2K patched source
$! supporting RT-11 dates > 31-Dec-2003
$!
$! Uses BP2 compiler
$!
$ run $bp2ic2
old fit.bas
compile fit/obj/chain/nowarn/list/cross:nokey
build fit
scratch
exit
$ tkb @fit
$ set file/prot=232 fit.tsk
$!
$! To install, copy the FIT.TSK to AUXLIB$:
$!
$!	$ rename auxlib$:fit.tsk auxlib$:fitold.tsk
$!	$ copy fit.tsk auxlib$:
$!
$ exit
$! Alternative is to compile using BASIC-PLUS to FIT.BAC using
$!
$!	$ SW BASIC
$!
$!	Ready
$!
$!	OLD FIT
$!
$!	Ready
$!
$!	COMPILE <232>
$!
