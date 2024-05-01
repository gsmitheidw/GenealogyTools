# GenealogyTools
Tools to aid Genealogy


### [Export-GedmatchProjectImages](https://github.com/gsmitheidw/GenealogyTools/blob/main/Export-GedmatchProjectImages.md)

Tool to aid posting Gedmatch Project Results to Forums and Facebook Groups. Written in powershell to take a spreadsheet in CSV from Gedmatch and sort results and convert them into nicely formatted images with column headers and conditional highlighting and marking closer MRCA (most recent common ancestors) in red text.

### Get-Triangulated-Kits.ps1
Look for triagulated segments in DNA matches from Gedmatch CSV files
Note: This will not tell you if the overlap segments are paternal or maternal part of 
each chromosome number! Use [DNAPainter.com](https://www.dnapainter.com) to build up a profile of known ancestor/match segments

<br>
Define your DNA segments in attached **test-segments.txt** file
in the format:
<chromosome number>,<start segment>,<end segment>
Example in attached file is this:

    10,83416997,119963569

Please replace this with your own.
Add as many lines as you require that identify a known "match" on a specific line.
Open the ps1 file in VSCode or Powershell ISE or run in a powershell terminal and you'll be prompted for
a CSV file from a Gedmatch project run. The resulting matches will appear in the terminal.
If there are no matches, there will be no output. 


