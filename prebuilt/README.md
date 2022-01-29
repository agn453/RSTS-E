In this directory you'll find a preconfigured and SYSGENed
RSTS/E V10.1 system disk (as an RD53 drive due to file size
limits under GitHub).

You'll need to download this and decompress it using ```bunzip2```
into an empty directory.

The e11-rsts10.ini file and simh-rsts10.ini configuration files (for John
Wilson's E11 and SIMH pdp11 emulators) may need to be edited to
change/add disk file location specifications and specify the correct
Ethernet interface for your system.

This system disk supports DECnet and LAT protocols (configured as
DECnet node ```1.42``` with the name ```RSTS```).

The local system privileged account is PPN ```1,42``` with password
```MANAGER```.  Once you log in, you may wish to either disable
DECnet startup using

```
$ rename decnet$:dstart.com decnet$:dstart.dis
```

or change the DECnet node number and name to suit your requirements
(where x.y is the new DECnet address) using -

```
$ ncp set exec state shut
$ ncp def exec address x.y
$ ncp def node x.y name RSTS
$ run $shutup    ! to reboot
```

System startup is configured in the file ```[0,1]START.COM``` and you can
use TECO or EDT to edit/view it from the privileged account.

PPN ```100,100``` is an account without a password that can run the original
Adventure (as ported by Bob Supnik) using the ADV command.

If you want to create a non-privileged account for yourself, use something like

```
$ create account /cluster=16 sy:[50,50]/name="Your Name"
```

FORTRAN-IV, FORTRAN-77, BASIC-PLUS and BASIC-PLUS2 are also available,
along with two version of Kermit (KERMIT and KRT).

Installation logs and files are in separate PPNs - all have the
password set to ```MANAGER```.  Use the following command to see which one
is which -

```
$ show account /all
```

