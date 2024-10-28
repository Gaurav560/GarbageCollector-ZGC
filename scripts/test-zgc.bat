@echo off
echo Creating directories...
mkdir ..\logs
mkdir ..\recordings

echo Starting application with ZGC...
java ^
-XX:+UseZGC ^
-Xms3g ^
-Xmx3g ^
-XX:+FlightRecorder ^
-XX:StartFlightRecording=name=GCTest,duration=120s,filename=../recordings/zgc-recording.jfr ^
-Xlog:gc*=debug:file=../logs/zgc-gc.log:time,uptime,level,tags:filecount=5,filesize=10m ^
-jar ../target/gc-test-0.0.1-SNAPSHOT.jar