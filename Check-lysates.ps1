$prefills = Get-Content -Path C:\Users\312127\Desktop\Prefill_targets\*.pre
$lysates = Get-Content -Path C:\Users\312127\Desktop\Prefill_targets\*.lys
[string[]]$samples = $null
[string[]]$lyssamples = $null


foreach ($line in $prefills) {
    if ($line -like "*<tube>*")
        {$samples += $line}
    }

$firstpart = $samples -replace "<Tube>", ''
$secondpart = $firstpart -replace "</Tube>", ''
$thirdpart = $secondpart -replace ' ', ''

foreach ($line in $lysates) {
    if ($line -like "*LYS*")
        {$lyssamples += $line}
    }

$lfirstpart = $lyssamples -split '"'

[string[]]$lyssamples = $null
foreach ($line in $lfirstpart) {
    if ($line -like "LYS*") {
        $lyssamples += $line
        }
    }

$counter = 0
[string[]]$missing = ''

foreach ($item in $lyssamples) {
    if ($thirdpart -contains $item) {
        $counter++
        }
    else {$missing += $item}
    }
