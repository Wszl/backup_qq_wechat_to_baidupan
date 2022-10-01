@echo off
@title redirect_wecaht_media_to_bandupan
setlocal
if not exist %2 (
	set base_dir=%UserProfile%\Documents\"WeChat Files"\%1\
	if not exist %base_dir% ( echo base dir not exists 
	pause
	exit
	)
) else (
	set base_dir=%2\"WeChat Files"\%1\
)

::sync dir
set dest=%base_dir%\FileStorage\File
if not exist %dest% ( echo sync dir not found
pause
exit
)

:: source dir
set fvideo=%base_dir%\FileStorage\Video
set fcache=%base_dir%\FileStorage\Cache
set video=%base_dir%\Video
set image=%base_dir%\Image
set file=%base_dir%\File
set attc=%base_dir%\Attachment

::move 
if not exist %dest%\FileStorage mkdir %dest%\FileStorage
if exist %fvideo% move /Y %fvideo% %dest%\FileStorage
if exist %fcache% move /Y %fcache% %dest%\FileStorage
if exist %video% move /Y %video% %dest%
if exist %image% move /Y %image% %dest%
if exist %file% move /Y %file% %dest%
if exist %attc% move /Y %attc% %dest%
::create symbol link
if exist %dest%\FileStorage\Video mklink /D %fvideo% %dest%\FileStorage\Video
if exist %dest%\FileStorage\Cache mklink /D %fcache% %dest%\FileStorage\Cache
if exist %dest%\Video mklink /D %video% %dest%\Video
if exist %dest%\Image mklink /D %image% %dest%\Image
if exist %dest%\File  mklink /D %file% %dest%\File
if exist %dest%\Attachment  mklink /D %attc% %dest%\Attachment
endlocal
echo "Done"
pause