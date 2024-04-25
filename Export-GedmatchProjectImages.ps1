<#
#  Script to output images from Gedmatch Project results (using csv file)
#  
#  Output files will be in the same folder as the csv file
#  and will be in the format: image<number>-GedmatchProject.png
#  
#  Note: Default csv files do not contain e-mail addresses so this will not filter
#  them if Gedmatch changes its csv files. Please check the output images before
#  uploading/sharing anywhere. MRCA highlighting and sort order can be changed in
#  the supplied .ini file.  
# 
#  Graham Smith, 2024
#>

if (Test-Path Export-GedmatchProjectImagesSettings.ini) {
$optionsFile = Get-Content Export-GedmatchProjectImagesSettings.ini -ErrorAction Stop | Where-Object { $_ -notmatch '^\s*;' } | ConvertFrom-StringData
} else {
    Write-Host 'Configuration ".ini" file missing!'
    exit
}


Add-Type -AssemblyName System.Windows.Forms

# File selection dialog
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.Filter = "CSV Files (*.csv)|*.csv|All Files (*.*)|*.*"
$openFileDialog.InitialDirectory = [Environment]::GetFolderPath('Desktop')
$openFileDialog.Title = "Select CSV File"

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

$csvData = Import-Csv -Path $csvFilePath | Select-Object -First 500 | Sort-Object -Property {$_.($optionsFile.SortOrder)}

# Define a function to truncate a string if it exceeds a certain length, names are too long in some cases
# but we'll use a function because might need this again. 
function Truncate-String {
    param(
        [string]$InputString,
        [int]$MaxLength
    )

    if ($InputString.Length -gt $MaxLength) {
        return $InputString.Substring(0, $MaxLength)
    } else {
        return $InputString
    }
}

function Convert-BatchToImage {
    param(
        [array]$Rows,
        [array]$Headers,
        [int]$ImageCounter,
        [string]$LastKitNumber
    )

    $font = New-Object System.Drawing.Font('Courier New', 11)  
    $rowHeight = 24  
    $headerHeight = 36  
    $columnWidth = 120  # These may need adjustments
    $nameColumnWidth = 420  
    $maxNameLength = 20  

    # Calculate image dimensions based on column count and row count
    $numColumns = $Headers.Count
    $imageWidth = ($columnWidth * ($numColumns - 1)) + $nameColumnWidth
    $numRows = $Rows.Count
    $imageHeight = $headerHeight + ($numRows * $rowHeight)

    # Create an image based on row data
    $image = New-Object System.Drawing.Bitmap $imageWidth, $imageHeight
    $graphics = [System.Drawing.Graphics]::FromImage($image)
    $graphics.Clear([System.Drawing.Color]::White)  # background white
    $blackBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Black) 
    $blueBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::LightBlue) 
    $redBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Red) 
    
    # Draw column headers
    $xPosition = 0
    foreach ($header in $Headers) {
        if ($header -eq "Name") {
            $graphics.DrawString("$header", $font, $blackBrush, $xPosition, 0)
            $xPosition += $nameColumnWidth
        } else {
            $graphics.DrawString("$header", $font, $blackBrush, $xPosition, 0)
            $xPosition += $columnWidth
        }
    }

    # Convert each row of the batch into text on the image
    $yPosition = $headerHeight
    $isEvenRow = $false
    foreach ($row in $Rows) {
        $xPosition = 0

        # Use conditional highlighting for easier reading
        if ($isEvenRow) {
            $graphics.FillRectangle($blueBrush, 0, $yPosition, $imageWidth, $rowHeight)
        }

        $isEvenRow = -not $isEvenRow  # Toggle the flag for the next row
        foreach ($header in $Headers) {
            if ($header -eq "Name") {
                $value = Truncate-String -InputString $row.$header -MaxLength $maxNameLength
                $graphics.DrawString("$value", $font, $blackBrush, $xPosition, $yPosition)
                $xPosition += $nameColumnWidth
            } else {
                $value = $row.$header
                if ($header -eq "MRCA" -and $row.$header -lt $optionsFile.MRCA) {
                    $graphics.DrawString("$value", $font, $redBrush, $xPosition, $yPosition)
                } else {
                    $graphics.DrawString("$value", $font, $blackBrush, $xPosition, $yPosition)
                }
                $xPosition += $columnWidth
            }
        }

        $yPosition += $rowHeight
    }
    
    $OutputDirectory = Split-Path -Path $csvFilePath -Parent
    # Save the image with a filename incrementing in number
    $imageName = "$OutputDirectory\image$ImageCounter-GedmatchProject.png"
    Write-Host "Saving image: $imageName"
    $image.Save($imageName, [System.Drawing.Imaging.ImageFormat]::png)
}

# Batch rows into groups of 30 kits
$batchSize = 30
$totalRows = $csvData.Count
$lastKitNumber = $csvData[-1].'Kit number'

$start = 0
$imageCounter = 1

while ($start -lt $totalRows) {
    $end = [Math]::Min($start + $batchSize - 1, $totalRows - 1)
    $batch = $csvData[$start..$end]

    # If this is the first batch, store column headers
    if ($start -eq 0) {
        $headers = $batch[0].PSObject.Properties.Name
    }

    # Convert the batch of rows into an image
    Convert-BatchToImage -Rows $batch -Headers $headers -ImageCounter $imageCounter -LastKitNumber $lastKitNumber

    $start += $batchSize
    $imageCounter++
}