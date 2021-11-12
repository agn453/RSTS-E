# RSTS-E
## Updates, Information and Software for the PDP-11 RSTS/E V10.1 Operating System

In this repository I aim to collect various software updates, information
and software for the RSTS/E Operating System for the PDP-11.

Most of these are for RSTS/E V10.1 which I run under emulation
using SIMH PDP11 on my PiDP11 front panel.

Recently some source-kits became available on the bitsavers web site
for RSTS/E V10.1 and I started investigations into fixing some Y2K issues
that I had found while tinkering.

## FIT

The first of these concerned transferring files from an RT-11 disk
image onto RSTS/E where the file dates should have been preserved by
the FIT program.  They were instead wrapping to an earlier date.

Part of the RT-11 Y2K updates to RT-11 V5.7 included
using additional bits in the RT-11 date word to store dates beyond
2003.  I've included the SPD
[here](https://github.com/agn453/RSTS-E/blob/master/docs/AA-5286M-TC-RT-11-V5.7_System_Release_Notes_Oct1998.pdf)
for reference (see Appendix E).

I've patched the source-code for FIT to fix this.

You'll find a context diff for the source-code changes in the
[cusp-updates/fit](https://github.com/agn453/RSTS-E/blob/master/cusp-updates/fit)
subdirectory, along with the command file I used to build
[this](https://github.com/agn453/RSTS-E/blob/master/cusp-updates/fit/fit.tsk)
updated task image for RSTS/E V10.1.  Just rename the original one in
the AUXLIB$ (or SY:[0,14]) directory and copy the update (with <232>
mode protection and RSX run-time system) in place.


## Paul Koning's DECnet/E Updates

Paul Koning has some additional updates for DECnet/E for the
Event Logger (EVTLOG.TSK) and for Async DDCMP support over a serial
line.

[Update 25-Aug-2020] There's also a replacement NCP program to fix
the "SHOW NODE" command.

[Update 11-Nov-2021] The DECnet/E event logger (EVTLOG.TSK) has been
updated again.  "There were two errors triggered by the fact that, as
of 10-Nov-2021 the Julian-half-day value has the top bit set, making it
look negative to PDP-11s.  One was in the conversion from RSTS internal
format to Julian-half-day, triggering an ```%integer error``` message.
The other was in decoding such Julian-half-day values when displaying
events -- doing an ASR to convert half days to whole days is not a
good idea..."

You'll find these on his GitHub at

https://github.com/pkoning2/decstuff

In addition, I have included one of his patches to improve Ethernet
throughput with RSTS/E V10.1 under SIMH PDP11 emulation.

You'll find this in the decnete subdirectory and a patch script
[nsp1.pat](https://github.com/agn453/RSTS-E/blob/master/decnete/nsp1.pat)
that you can apply with ONLPAT to the monitor SIL.  The
[nsp1.txt](https://github.com/agn453/RSTS-E/blob/master/decnete/nsp1.txt)
file has the details.


## Installing DIBOL from the PATCH$ directory

Not related to updates - but may be useful/informative and nostalgic!

I posted to the USENET newsgroup alt.sys.pdp11 recently describing
how to install PDP-11 DIBOL V6.1-F from the PATCH$ directory.  A
full install kit exists on the system if you include patches when
installing RSTS/E V10.1 - and you don't need original media to get it
working.  The details are
[here](https://github.com/agn453/RSTS-E/blob/master/layered/dibol/dibol.txt).


## On the look-out for other Y2K updates for RSTS/E

I remember seeing a TK50 tape of further Y2K updates that was
released by Mentec in around the 1999 timeframe.  Sadly, I don't have a
copy of this - but I have managed to track down the following
[Cover Letter](https://github.com/agn453/RSTS-E/blob/master/docs/AV-RK36A-TE-RSTS_E-V10.1A_Cover_Letter_Year_2000_Update_1999.pdf)
for this tape.  If anyone has a tape-image copy of this please
let me know.  It has EDT updates as well as date changes to the
RT11.RTS and system utilities PIP.SAV, LINK.SAV, LIBR.SAV and SYSMAC.SML


## Software

I've previously posted to various mailing lists concerning some software
that enhances your nostaligia for RSTS/E.  I'm adding a few disk images and a
DECtape image to the software folder for the following -

### PDP-11 Kermit (Kermit-11 T3.63 dated 3rd October 2006).

This is on an RL02 disk image in RSTS Level 1.2 format (label
KER363) that I used to re-create various versions of Kermit-11 (for
RSTS/E, RSX-11M-Plus, P/OS and RT-11).
Updates were downloaded from Johnny Billquist's HECnet node MIM:: and
applied to the most recent official kermit sources.
You'll find the source files, batch build command files
and binaries in the account [11,6]

```
$ mount dl0: ker363
$ dir dl0:[11,6]
```

A direct download link for the Kermit RL02 image is
[rl02-ker363.dsk](https://github.com/agn453/RSTS-E/blob/master/software/rl02-ker363.dsk)

### Dave Ahl's 101 BASIC computer games.

I've supplied two RL01 disk images,
One in RSTS Level 1.2 format for RSTS/E V07 and later, and the other in the
original RSTS Level 0.0 format for use under RSTS V04 to V06).  The disk
files have been updated so the games can be played on recent versions of
BASIC-Plus.  The files are in two accounts [100,100] and [100,101].  Also
included on this disk is a copy of the original adventure game that
was ported from a PDP-10 to run under PDP-11 Fortran by Kent Blackett and
Bob Supnik.  You'll find this in the account [100,102].

```
$ mount dl0: games
```

Also I've included a DECtape image (in
DOS-11 format).  This is directly readable by a RSTS system that includes
DECtape (DT device) device support.

The RL01 GAMES disk image is
[rl01-games.dsk](https://github.com/agn453/RSTS-E/blob/master/software/rl01-games.dsk)
and the image for older versions of RSTS V04A to V06C is
[rl01-games-rsts0-0.dsk](https://github.com/agn453/RSTS-E/blob/master/software/rl01-games-rsts0-0.dsk).
An image of an original DECtape containing volume 1 of the games is
[ahl_basic_games.dta](https://github.com/agn453/RSTS-E/blob/master/software/ahl_basic_games.dta).

### ZEMU - the Infocom Z-machine interpreter

This is my V2.5 (originally written by Johnny Billquist
and Megan Gentry).  This version includes the capability to run various
Infocom interactive adventure games (like ZORK1, ZORK2, ZORK3...) under RSTS/E
using the RT11 run-time system.  This disk is in RT-11 format and the files
need to be copied using the FIT command into an empty account on the
system disk.  The ZEMU.DOC file describes how to install this software.

```
$ create/account sy:[11,10]/name="ZEMU 2.5"
$ fit sy:[11,10]=dl0:*.*/rt
```

The RL02 disk image (in RT-11 format) is
[rl02-zemu25.dsk](https://github.com/agn453/RSTS-E/blob/master/software/rl02-zemu25.dsk)


## Forth RTS

Some may not realise this - but a port of FIG-Forth V2 as a run-time system
under RSTS/E is available if you choose to install the Unsupported software.
The porting to RSTS/E was done by Paul Koning and was used as an internal
RSTS/E development tool.  It runs on any version of RSTS/E from V7.2 or
later.

The public domain sourcecode for the Forth RTS in Macro-11 is also
included in the UNSUPP$:FORTH.MAC file.

To enable the Forth RTS, add the following to your SY:[0,1]START.COM file
under the section "   Installing run-time systems and libraries" -

```
 install/runtime_system UNSUPP$:FORTH
```

This will add it to the system when you reboot (or alternatively you
can try it out using the following)

```
$ run $utlmgr
Utlmgr> install/runtime_system UNSUPP$:FORTH
Utlmgr> ^Z
```

Forth compiled programs have a .4TH file type or you
can interactively enter them by switching to the newly installed RTS.
By convention, Forth source files have the .FTH file type.

For example - to multiply the integers 123 and 45 and print the result -

```
$ sw forth

FIG-FORTH V2.0+
123 45 * .
5535  ok
```

To exit back to DCL use 

```
ccl switch dcl
$ 
```

Two Forth programs are included in the UNSUPP$: directory - ODT and
SDA.   ODT is the octal debugging tool and it handles large files; and
SDA is an interactive crash dump analyser (inspired by the VMS tool
of the same name).  You can run like any other program -

```
$ run unsupp$:sda

SDA V10.1-0G for RSTS/E V10.1-0L        RSTS V10.1-L PDP11/70 SIMH

Sil <SY0:[0,1]SIMH70.SIL> ? 
[Using DU0:[0,1]SIMH70.SIL]
Crash dump file <DU0:[0,1]CRASH .SYS> ? 
[Using DU0:[0,1]CRASH .SYS]

[Help is available]

Sda> help
Type 'HELP <name>' to get help for <name>
Type 'HELP INTRODUCTION' for an introduction to SDA

HELP is available for the following functions:
        TAG->A  LB      LX      LS      L       DEFINE  TAB     E 
        USE     MODULE  M->A    %.      A.      AO.     U.R     U. 
        EXIT    FIND    .CCLS   .CCLDEF         .FCBLIST        .FILE 
        .WCB    .FCB    B       J->JCR  NARROW  2K@     .NODE   .NODEID 
        .TIME   .DATE   2%.     .POS    .       .R      CRASH   SIL
        WIDE    C->A    K@      CA.     CO.     SPACES  O.      WO. 
        SHOW 

HELP is also available for:
        DO      INTRODUCTION    FORTH   NUMBERS         SYMBOLS 

Sda> ^Z
$
```

The source-code for SDA is in UNSUPP$:SDA.FTH for your perusal and
enjoyment.

There's also a great deal of information about Forth on the
[www.forth.org](http://www.forth.org) web site.  The source-code
also has information about Forth's handling of program SCREENs and
files.


## Microcomputer cross-assemblers etc.

In the 
[micros](https://github.com/agn453/RSTS-E/blob/master/micros)
subdirectory, I've added a few of the microcomputer cross-assemblers
that I developed whilst an undergraduate.  These were originally
written in BASIC-PLUS - and the source files have been converted
to a format now acceptable to both BASIC-PLUS and the PDP-11
BASIC-PLUS-2 V2.7-00 compiler. (The original source files used
continuation lines of a LF CR NUL, with CR LF at the
end of each statement).

Cross-assemblers for 

* National Semiconductor SC/MP
[SCMPCA.B2S](https://github.com/agn453/RSTS-E/blob/master/micros/SCMPCA.B2S)

* Intel 8080/8085 with some Zilog Z80 op-codes (using Intel/TDL-style
mnemonics)
[X80.B2S](https://github.com/agn453/RSTS-E/blob/master/micros/X80.B2S)

* MOS Technology 6502
[X65.B2S](https://github.com/agn453/RSTS-E/blob/master/micros/X65.B2S)

A dis-assembler for

* National Semiconductor SC/MP
[DISASM.B2S](https://github.com/agn453/RSTS-E/blob/master/micros/DISASM.B2S)

and,

* A program to convert hexadecimal output from the cross-assembler
to an Intel HEX format absolute loader format file
[INTEL.B2S](https://github.com/agn453/RSTS-E/blob/master/micros/INTEL.B2S)

There are DCL command files to compile them, and I've included a binary
task-image for each.


## Background

I've been a User/Systems Programmer/System Manager/Computer Networking
Engineer since my University days.  

My first contact was with RSTS/E V04A-12 in 1975 on a PDP-11/20 with
a Teletype model 33 console.  In 1977 a PDP-11/45 was purchased along
with RSX-11D for the Electrical Engineering department for research
purposes. I managed to get access to this machine and was able to book
one or two hour exclusive sessions in the evenings.  With things being
how they were in those days, an RK05 copy "came into my hands" containing
the installation kit for RSTS/E V06B.  I no longer have the RK05, but I
do have this
[DECtape](https://github.com/agn453/RSTS-E/blob/master/photos/DECtape-RSTS-E-V06B.jpeg)
that contains the sysgened monitor for V06B
that one day I might be able to get at!

Not being overly enthusiastic about RSX-11D, I used my allotted time
to run RSTS/E and develop various cross-assemblers for 8085/Z80/6502
microcomputers.  It had a VT05 console (20 lines of 72 columns) so I could
do this without wasting paper!

Also at this time, a campus-wide time-sharing system using a PDP-11/45
was being deployed - at first with 16 terminals (LA30S) running
RSTS/E V06B.  This was later updated to an PDP-11/70 with more memory
and a fleet of additional video terminals (mainly ADM3A but with a few
VT52s).

I'll add more here later...

Tony
