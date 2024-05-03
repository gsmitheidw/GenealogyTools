# Get-TriangulatedKits

Get-TriangulatedKits is a Powershell script to look for triagulated segments in DNA matches from Gedmatch CSV files
Use [DNAPainter.com](https://www.dnapainter.com) to build up a profile of known ancestor/match segments. Then take those Chromosome numbers with start and end segments to compare against matches. 


Define your DNA segments in attached **test-segments.txt** file in the format:

\<chromosome number\>,\<start segment\>,\<end segment\>

Example in sample file is this:

    10,83416997,119963569

Please replace this with your own.
Add as many lines as you require that identify a known "match" on a specific line.
Open the ps1 file in VSCode or Powershell ISE or run in a powershell terminal and you'll be prompted for
a CSV file from a Gedmatch project run. The resulting matches will appear in the terminal.
If there are no matches, there will be no output.

## Note

This will not tell you if the overlap segments are paternal or maternal part of each chromosome number!
You will have to identify that by other means such as examining trees that document that match or
ruling out by identifing the other side of that same chromosome number in the same position.

