$textToWrite = "Hello, this is a sample text file. It contains some text to demonstrate file operations in PowerShell."
$filePath = "text-sample.txt"

Set-Content -Path $filePath -Value $textToWrite

$copyFilePath = "text-sample-copy.txt"

Copy-Item -Path $filePath -Destination $copyFilePath

$lines = Get-Content -Path $filePath

$dotCount = 0

foreach ($line in $lines) {
    foreach ($char in $line.ToCharArray()) {
        if ($char -eq '.') {
            $dotCount++
        }
    }
}

Write-Output "Number of dots in the file: $dotCount"