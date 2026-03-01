
$memoryData = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object *memory*
$cpuData = Get-CimInstance -ClassName Win32_Processor | Select-Object *
$storePath="C:\Users\batur\Desktop\Data"
$userChoice=Read-Host -Prompt "Please Enter to see CPU data for 1, Memory data for 2"

        if(!(Test-Path "C:\Users\batur\Desktop\Data")){
            New-Item -ItemType Directory -Path "C:\Users\batur\Desktop\Data"
        }
        
        
        switch ($userChoice) {
        '1' { 
        $friendlycpuData=[PSCustomObject]@{
        'Processor model' = $cpuData.Name
        'Current usage' = $cpuData.LoadPercentage
        }
            Write-Output $friendlycpuData | Export-Csv -Path "C:\Users\batur\Desktop\Data\cpuData.csv"
            Write-Output "The system information about CPU has been created successfully to $storePath."
            break
        }
        
        
        '2' {
        $friendlymemoryData=[PSCustomObject]@{
        'Total RAM Value' = $memoryData.TotalVisibleMemorySize
        'Free RAM Value' = $memoryData.FreePhysicalMemory
        }
            Write-Output $friendlymemoryData | Export-Csv -Path "C:\Users\batur\Desktop\Data\memoryData.csv" 
            Write-Output "The system information about memory has been created successfully to $storePath."
            break
        }   
    
        Default {
        Write-Output "You've entered the wrong input."

    }
}




