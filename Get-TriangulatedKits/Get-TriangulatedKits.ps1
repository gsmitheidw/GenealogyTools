# Look for triagulated segments in DNA matches from Gedmatch CSV files
# Note: Will not tell you if paternal or maternal part of each chromosome number

# Define your DNA segments in attached test-segments.txt file
# in the format:
# chromosome number,start segment,end segment
# example in attached file is this
# 10,83416997,119963569
# Please replace this with your own.
# Add as many lines as you require that identify a known "match" on a specific line


$scriptDirectory = $PSScriptRoot
$segmentFilePath = Join-Path -Path $scriptDirectory -ChildPath "test-segments.txt"

if (-not (Test-Path $segmentFilePath)) {
    Write-Host 'Error: The segment file does not exist.'
    exit
}
$segmentsData = Get-Content -Path $segmentFilePath

# Parse segments data
$testSegments = @()
foreach ($segment in $segmentsData) {
    $segmentParts = $segment -split ','
    $testSegments += @{
        'Chromosome' = [int]$segmentParts[0]
        'Start' = [int]$segmentParts[1]
        'End' = [int]$segmentParts[2]
    }
}


# File selection dialog
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.Filter = 'CSV Files (*.csv)|*.csv|All Files (*.*)|*.*'
$openFileDialog.InitialDirectory = [Environment]::GetFolderPath('Desktop')
$openFileDialog.Title = 'Select CSV File'

if ($openFileDialog.ShowDialog() -eq 'OK') {
    $csvFilePath = $openFileDialog.FileName
} else {
    Write-Host 'No file selected. Exiting script.'
    exit
}

if (-not (Test-Path $csvFilePath)) {
    Write-Host 'Error: The selected CSV file does not exist.'
    exit
}

# Import Gedmatch Data
$csvData = Import-Csv -Path $csvFilePath

# Initialize a list to store triangulated segment information
$triangulatedSegments = @()

# Loop through each row in the CSV data
foreach ($row in $csvData) {
    # Cast start and end positions to integers for comparison
    $start = [int]$row.Start
    $end = [int]$row.End
    
    # Check if the current row overlaps with any test segment from test-segments.txt
    foreach ($testSegment in $testSegments) {
        if ($row."Chromosome" -eq $testSegment."Chromosome" -and
            $start -le $testSegment."End" -and
            $end -ge $testSegment."Start") {
            # If the segment overlaps with a test segment, add the information to our list
            $triangulatedSegments += [PSCustomObject]@{
                'Kit number' = $row.'Kit number'
                'Name' = $row.Name
                'Chromosome' = $row.Chromosome
                'Start' = $row.Start
                'End' = $row.End
                'cM' = $row.cM
                'SNPs' = $row.SNPs
                'Overlap' = $row.Overlap
                'MRCA' = $row.MRCA
                'Y Haplogroup' = $row.'Y Haplogroup'
                'MT Haplogroup' = $row.'MT Haplogroup'
                'Source' = $row.Source
            }
        }
    }
}

# Output the triangulated segment information in a tabulated format
$triangulatedSegments | Sort-Object -Property MRCA | Format-Table -AutoSize -Property `
    @{Name="Kit number"; Expression={$_.'Kit number'}; Width=15},
    @{Name="Name"; Expression={$_.Name}; Width=20},
    @{Name="Chromosome"; Expression={$_.Chromosome}; Width=12},
    @{Name="Start"; Expression={$_.Start}; Width=12},
    @{Name="End"; Expression={$_.End}; Width=12},
    @{Name="cM"; Expression={$_.cM}; Width=12},
    @{Name="SNPs"; Expression={$_.SNPs}; Width=12},
    @{Name="Overlap"; Expression={$_.Overlap}; Width=12},
    @{Name="MRCA"; Expression={$_.MRCA}; Width=12},
    @{Name="Y Haplogroup"; Expression={$_.'Y Haplogroup'}; Width=15},
    @{Name="MT Haplogroup"; Expression={$_.'MT Haplogroup'}; Width=15},
    @{Name="Source"; Expression={$_.Source}; Width=25} 

