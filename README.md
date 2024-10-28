# GenealogyTools
Tools to aid Genealogy


## [Export-GedmatchProjectImages](https://github.com/gsmitheidw/GenealogyTools/tree/main/Export-GetmatchProjectImages)

Tool to aid posting [Gedmatch](https://www.gedmatch.com) Project Results to Forums and Facebook Groups. Written in powershell to take a spreadsheet in [CSV](https://en.wikipedia.org/wiki/Comma-separated_values) from Gedmatch and sort results and convert them into nicely formatted images with column headers and conditional highlighting and marking closer MRCA (most recent common ancestors) in red text.


## [Get-TriangulatedKits](https://github.com/gsmitheidw/GenealogyTools/blob/main/Get-TriangulatedKits/README.md)

Powershell script to look for triangulated segments in DNA matches from [Gedmatch](https://www.gedmatch.com) CSV files and output a list of people from a particular Gedmatch project results that match you on those chromosomes on those segments you're interested in.


## [Test-MatchGedmatch](https://github.com/gsmitheidw/GenealogyTools/blob/main/Test-MatchGedmatch/README.md) 🟠Beta

Script to login to Gedmatch to test a given kit against your own. Written in Python with Selenium. Requires Firefox.
Also provided as a Windows binary. 


## [MakeMermaidTree](https://github.com/gsmitheidw/GenealogyTools/blob/main/MakeMermaidTree/README.md)

Create tree structures using Mermaid-cli. This allows you create tree diagrams using only code that can be rendered to numerous formats or for embedding in Markdown files to becompiled into documentation using pandoc or equivalent. Requires npm (nodejs) and mermaid-cli both of which are cross platform.



<hr>

### Security (re: Powershell) for Scripts

Powershell may require you change [Execution Policy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4) before being able to run these scripts. If you get an error about this, run this line in Powershell first:

    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force


