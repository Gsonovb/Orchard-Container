FROM microsoft/aspnet

Add download.ps1 /download.ps1
RUN powershell.exe -ExecutionPolicy RemoteSigned -noninteractive -File /download.ps1

EXPOSE  80
