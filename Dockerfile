FROM microsoft/aspnet
#ARG site_root=/Orchard

Add download.ps1 /download.ps1

RUN powershell.exe -ExecutionPolicy RemoteSigned -noninteractive -File /download.ps1

#ADD ${site_root} /inetpub/wwwroot
RUN icacls c:\inetpub\wwwroot\App_data /T /grant IIS_IUSRS:M
RUN icacls c:\inetpub\wwwroot\Media /T /grant IIS_IUSRS:M
#ADD setacl.ps1 /inetpub
#RUN powershell.exe -ExecutionPolicy RemoteSigned -noninteractive -File /inetpub/setacl.ps1
  
EXPOSE  80

#ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]