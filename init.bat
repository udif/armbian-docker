IF "%REPO%"=="" (set REPO=https://github.com/igorpecovnik/lib.git)
IF "%dctag%"=="" (set dctag=udif/armbian)

if exist ..\lib GOTO nolib
        git clone %REPO% ../lib
:nolib

docker build -t %dctag% .

if errorlevel 1 goto err

cd ..
docker run -v %cd%\lib:/root/lib -t -i %dctag%

:err
echo "ERROR: Unable to build container"
exit 1