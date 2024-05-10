# Test-MatchGedmatch 🟠 BETA

Simple utility that uses Selenium to log into Gedmatch and test if a kit matches yours and reports
a match or not match. It (currently) does nothing more and will not show Chromosome/Segment data of
a postive match. This is still in early active development, please do not rely on this yet.
There may be incorrect results reported! 


## Requirements

Firefox web browser installed
Python installed and on path (optional)

## Instructions for use

1. Edit the Test-MatchGedmatch.ini file in a text editor and put in your kit number and login credentials for gedmatch.
If you have a superkit, use that because theres no option for multiple kits

2. Then either run:

    python Test-MatchGedmatch.py <kit number>

or run the provided Test-MatchGedmatch.exe followed by kit number. 

It will simply return match or not match based on default Gedmatch values


### Security

* The plain text ini file is not hashed or secured in any way so only use this on a system you installed and trust is secure. I may improve this in a future update.  
* I've provided a compiled executable for convenience but if you don't trust it, reverse engineer it or just use python seperately which you can inspect the source as you wish. 

