@echo off
set /P video_path=Drop video in the Window or type path: 
echo %video_path%
echo 									Hint: hours:minutes:seconds
set /P start=Seconds into the video from the beginning to cut, as a number OR timecode (example: 00:05:10): 
echo Cut first %start% seconds
echo.
echo 					Hint: hours:minutes:seconds
set /P end=Seconds to timecode to trim the video up to: 
echo Cut to %end% seconds
echo.
set /P name=New video name (leave blank to overwrite): 
echo Cut %name% seconds from the beginning
echo.
::set /P reencode=Reencode? (y/n): 
echo press any key to begin
pause
if not defined name (goto copy && echo Going to make a copy) else (goto new)
pause

:copy
echo Overwriting %video_path%
echo ffmpeg -ss -i %video_path% %start% -to %end% -c:v copy -c:a copy %video_path%
ffmpeg -ss -i %video_path% %start% -to %end% -c:v copy -c:a copy %video_path%
pause

:new
echo Creating %name%
echo ffmpeg -i %video_path% -ss %start% -to %end% -c:v copy -c:a copy %name%
ffmpeg -i %video_path% -ss %start% -to %end% -c:v copy -c:a copy %name%
pause
