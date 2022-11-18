if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;
    exit;
}

Push-Location $PSScriptRoot;

try {
    $RegInfo = Get-ChildItem "HKLM:\HKEY_LOCAL_MACHINE\SOFTWARE\Adobe\Photoshop" | ForEach-Object { Get-ItemProperty $_.PsPath };

    $AppPath = $RegInfo.ApplicationPath;

    if ([string]::IsNullOrEmpty($AppPath)) {
        Write-Error "Photoshop installation path no found, please copy 'Photoshop-Layer-Normalization-Tool' directory into 'PHOTOSHOP_INSTALL_PATH\Presets\Scripts' directory.";
        exit(1);
    }

    $ScriptDirPath = Join-Path $AppPath "Presets\Scripts";
    $NewScriptDirPath = Join-Path $ScriptDirPath "Photoshop-Layer-Normalization-Tool";

    if (Test-Path $NewScriptDirPath) {
        Write-Output "Old version Photoshop-Layer-Normalization-Tool plugin has been installed, delete it.";
        Remove-Item $NewScriptDirPath -Recurse;
    }

    Copy-Item -Path "../Photoshop-Layer-Normalization-Tool" -Destination $NewScriptDirPath -Recurse;

    Write-Output "Photoshop-Layer-Normalization-Tool plugin has been installed in '$NewScriptDirPath'.";
}
finally {
    Pop-Location
    Write-Host -NoNewLine 'Press any key to continue...';
    [System.Console]::ReadKey().Key.ToString()
}
