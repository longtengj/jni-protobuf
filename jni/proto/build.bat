@echo off

echo ���ԭ�����ڵ��ļ�......

del /f /s /q *.cc
del /f /s /q *.cpp
del /f /s /q *.h


echo ���������ļ�.......



rem protoc -I=.\  --cpp_out=.\  .\upmsgstruct.proto
rem protoc -I=.\  --cpp_out=.\  .\upmsg.proto

for /r . %%i in (*.proto) do (


protoc -I=.\  --cpp_out=.\  .\%%~nxi


)





echo �ļ��������,��ȴ�......

rename *.cc  *.cpp


copy /Y  .\*.h  .\..\app\*.h


copy  /Y  .\*.cpp  .\..\app\*.cpp


echo �ļ��������! ���ݵ�ǰĿ¼�µ��ļ�...


rmdir /S /Q  .\bak

mkdir .\bak

copy /Y  .\*.h  .\bak\*.h


copy  /Y  .\*.cpp  .\bak\*.cpp


del /f  /q *.cc
del /f  /q *.cpp
del /f  /q *.h

echo �������!


pause