# Export-GedmatchProjectImages

Exports match results of Gedmatch Project to batches of images.

## Overview
Output files contain 500 closest kits (by MRCA) which are then
sorted into ascending kit number order. Output files are also 
named in sequence in the filename.

## Usage


1. Run the gedmatch project, download the csv file using the "Download CSV" button
2. [Click here to go to Releases Page](https://github.com/gsmitheidw/GenealogyTools/releases)
and expand Assets and download **Export-GedmatchProjectImages.zip**

3. Extract the contents to any folder. There should be three files.
Then open **Export-GedmatchProjectImages.ps1** in "Powershell ISE" which is already preinstalled in windows. 
You'll find it in the start menu. Of course powershell in command line or VS Code are also options.

![open ps1 file](https://github.com/gsmitheidw/GenealogyTools/blob/main/Export-GetmatchProjectImages/images/open-ps1.png?raw=true "Open ps1 file")


4. Press the green triangle play button to start it running. It will prompt you to choose the CSV file
downloaded from Gedmatch. Once you do that, it'll create image files in the same folder
the CSV file is in.



Note: you may need to run:

    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser 

(in the blue panel window in Powershell ISE) and press enter to allow the script to run. 


![Read to Run](https://github.com/gsmitheidw/GenealogyTools/blob/main/Export-GetmatchProjectImages/images/ready-to-run.png?raw=true "Read to run")

## Sample Output

This is what you should expect to see in each file produced:


![Sample Output](https://github.com/gsmitheidw/GenealogyTools/blob/8e881f3e2a4340a35b5a6054b47f0df41e384df2/Export-GetmatchProjectImages/images/sample-output.png "Sample Output") 

## Options

Export-GedmatchProjectImagesSettings.ini is a plain text file which you can edit to change the sort order
or the value by which the MRCA (Most Recent Common Ancestor) is highlighted in red text.
Defaults settings are:

    SortOrder=Kit number
    MRCA=5

Comments are preceded with a semi-colon. You can also set ```SortOrder=Name``` if you prefer.

## Notes

:warning: Always spot check output files before posting on forums/facebook. 
Gedmatch doesn't include e-mail addresses in the CSV file but this could change. 




