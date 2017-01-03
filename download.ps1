#This is the script file for development.
#https://github.com/OrchardCMS/Orchard/releases/download/1.10/Orchard.Web.zip
$url     = "https://github.com/OrchardCMS/Orchard/releases/download/1.10/Orchard.Web.zip" ;
$dname   = "Web.zip"
$desdir  = "C:\inetpub\wwwroot";
$movedir = "Orchard";


$filename = Join-Path $env:temp $dname ;
Write-Host "Download $url  to $filename ."
$r = Invoke-WebRequest $url   -OutFile $filename ;


$expdir = Join-Path -Path $env:temp  -ChildPath ([System.IO.Path]::GetFileNameWithoutExtension($dname));
Write-Host "Expand Archive $filename to $expdir ."
Expand-Archive -Path $filename -DestinationPath $expdir  -Force


$mdir = Join-Path $expdir $movedir;
Write-Host "Move Files $expdir to $desdir .";
robocopy "$mdir" "$desdir" /E 



Write-Host "Granting authority  ";
icacls.exe c:\inetpub\wwwroot\App_data /T /grant IIS_IUSRS:M
icacls.exe c:\inetpub\wwwroot\Media /T /grant IIS_IUSRS:M


Write-Host "Delete Temp Files $expdir .";
Remove-Item $expdir  -Recurse -Force; 
Write-Host "Delete Download File $filename .";
Remove-Item $filename -Force;

if($args[0] -ne "debug")
{
    Write-Host "Delete script ";
    remove-item $MyInvocation.MyCommand.Path -force    
}

Write-Host "Done.";