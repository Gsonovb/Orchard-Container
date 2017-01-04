#This is the script file for development.
#https://crowdin.net/download/project/orchard-cms/zh-CN.zip
$url     = "https://crowdin.net/download/project/orchard-cms/zh-CN.zip" ;
$dname   = "orchard-zh-cn.zip"
$desdir  = "C:\inetpub\wwwroot";
$movedir = "Source";


$filename = Join-Path $env:temp $dname ;
Write-Host "Download $url  to $filename ."
$r = Invoke-WebRequest $url   -OutFile $filename ;


$expdir = Join-Path -Path $env:temp  -ChildPath ([System.IO.Path]::GetFileNameWithoutExtension($dname));
Write-Host "Expand Archive $filename to $expdir ."
Expand-Archive -Path $filename -DestinationPath $expdir  -Force


$mdir = Join-Path $expdir $movedir;
Write-Host "Move Files $expdir to $desdir .";
robocopy "$mdir" "$desdir" /E 



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