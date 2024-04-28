# Export-GedmatchProjectImages

Exports match results of Gedmatch Project to batches of images.

## Overview
Output files contain 500 closest kits (by MRCA) which are then
sorted into ascending kit number order. Output files are also 
named in sequence in the filename.

## Usage

https://github.com/gsmitheidw/GenealogyTools/releases


1. Run the gedmatch project, download the csv file using the "Download CSV" button
2. [Click here to go to Releases Page](https://github.com/gsmitheidw/GenealogyTools/releases)
and expand Assets and download Export-GedmatchProjectImages.zip

3. Extract the contents to any folder. There should be three files.
Then open **Export-GedmatchProjectImages.ps1** in "Powershell ISE" which is already preinstalled in windows. 
You'll find it in the start menu. Of course powershell in command line or VS Code are also options.

4. Press the green triangle play button to start it running. It will prompt you to choose the CSV file
downloaded from Gedmatch. Once you do that, it'll create image files in the same folder
the CSV file is in. 

## Options

Export-GedmatchProjectImagesSettings.ini is a plain text file which you can edit to change the sort order
or the value by which the MRCA (Most Recent Common Ancestor) is highlighted in red text.
Defaults settings are:

    SortOrder=Kit number
    MRCA=5

Comments are preceded with a semi-colon.

## Notes

:warning: Always spot check output files before posting on forums/facebook. 
Gedmatch doesn't include e-mail addresses in the CSV file but this could change. 




