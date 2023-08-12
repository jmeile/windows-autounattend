#installChocolateyTask by Josef Meile

# This will add a task to automatically update chocolatey packages
Register-ScheduledTask -xml (Get-Content 'Update Chocolatey packages.xml' | Out-String) -TaskName "Update Chocolatey packages" -TaskPath "\Chocolatey\" -User System –Force
sleep 5