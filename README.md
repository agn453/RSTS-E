# RSTS-E
Updates, Information and Software for the PDP-11 RSTS/E V10.1 Operating System
------------------------------------------------------------------------------

In this repository I aim to collect various software updates, information
and software for the RSTS/E Operating System for the PDP-11.

Most of these are for RSTS/E V10.1 which I run under emulation
using SIMH PDP11 on my PiDP11 front panel.

Recently some source-kits became available on the bitsavers web site
for RSTS/E V10.1 and I started investigations into fixing some Y2K issues
that I had found while tinkering.

FIT
---

The first of these concerned transferring files from an RT-11 disk
image onto RSTS/E where the file dates should have been preserved by
the FIT program.  They were instead wrapping to an earlier date.

Part of the RT-11 Y2K updates to RT-11 V5.7 included
using additional bits in the time-of-day word to store dates beyond
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


Paul Koning's DECnet/E Updates
------------------------------

Paul Koning has some additional updates for DECnet/E for the
Event Logger (EVTLOG.TSK) and for Async DDCMP support over a serial
line.  You'll find these on his GitHub at

https://github.com/pkoning2/decstuff

In addition, I have included one of his patches to improve Ethernet
throughput with RSTS/E V10.1 under SIMH PDP11 emulation.

You'll find this in the decnete subdirectory and a patch script
[nsp1.pat](https://github.com/agn453/RSTS-E/blob/master/decnete/nsp1.txt)
that you can apply with ONLPAT to the monitor SIL.  The
[nsp1.txt](https://github.com/agn453/RSTS-E/blob/master/decnete/nsp1.txt)
file has the details.


Installing DIBOL from the PATCH$ dirctory
-----------------------------------------

Not related to updates - but may be useful/informative and nostalgic!

I posted to the USENET newsgroup alt.sys.pdp11 recently describing
how to install PDP-11 DIBOL V6.1-F from the PATCH$ directory,  A
full install kit exists on the system if you include patches when
installing RSTS/E V10.1 - and you don't need original media to get it
working.  The details are
[here](https://github.com/agn453/RSTS-E/blob/master/layered/dibol/dibol.txt).


On the look-out for other Y2K updates for RSTS/E
------------------------------------------------

I remember seeing a TK50 tape of further Y2K updates that was
released by Mentec in around the 1999 timeframe.  Sadly, I don't have a
copy of this - but I have managed to track down the following
[Cover Letter](https://github.com/agn453/RSTS-E/blob/master/docs/AV-RK36A-TE-RSTS_E-V10.1A_Cover_Letter_Year_2000_Update_1999.pdf)
for this tape.  If anyone has a tape-image copy of this please
let me know.  It has EDT updates as well as date changes to the
RT11.RTS and system utilities PIP.SAV, LINK.SAV, LIBR.SAV and SYSMAC.SML


Background
----------

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
microcomputers.  It had VT05 console (20 lines of 72 columns) so I could
do this without wasting paper!

Also at this time, a campus-wide time-sharing system using a PDP-11/45
was being deployed - at first with 16 terminals (LA30S) running
RSTS/E V06B.  This was later updated to an PDP-11/70 with more memory
and a fleet of additional video terminals (mainly ADM3A but with a few
VT52s).

I'll add more here later...

Tony
