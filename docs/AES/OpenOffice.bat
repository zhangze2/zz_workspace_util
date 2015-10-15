@echo Setting Open_office home like "C:\Program Files\OpenOffice.org 3\program\"
@echo off
cd C:\Program Files\OpenOffice.org 3\program\
cd C:
soffice.exe -headless -accept="socket,host=127.0.0.1,port=8100;urp;"
pause