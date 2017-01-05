FROM microsoft/aspnet

Add download.ps1 /download.ps1
RUN powershell.exe -ExecutionPolicy RemoteSigned -noninteractive -File /download.ps1

Add download_Localization.ps1 /download_Localization.ps1
RUN powershell.exe -ExecutionPolicy RemoteSigned -noninteractive -File /download_Localization.ps1

  
EXPOSE  80

#ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]