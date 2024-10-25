@echo off
echo Creating directories...
mkdir ..\logs
mkdir ..\recordings

echo Starting application with G1 GC...
java ^
-XX:+UseG1GC ^
-Xms3g ^
-Xmx3g ^
-XX:+FlightRecorder ^
-XX:StartFlightRecording=name=GCTest,duration=120s,filename=../recordings/g1-recording.jfr ^
-Xlog:gc*=debug:file=../logs/g1-gc.log:time,uptime,level,tags:filecount=5,filesize=10m ^
-jar ../target/gc-test-0.0.1-SNAPSHOT.jar