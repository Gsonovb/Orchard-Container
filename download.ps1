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

Write-Host "Delete Files $expdir .";
Remove-Item $expdir  -Recurse -Force; 
Write-Host "Delete Files $filename .";
Remove-Item $filename -Force;
Write-Host "Done.";