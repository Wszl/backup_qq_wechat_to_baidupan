@echo off
@title redirect_qq_media_to_bandupan
setlocal
::base dir
set base_dir=%UserProfile%\Documents\"Tencent Files"\%1\
if not exist %base_dir% ( echo base dir not exists 
pause
exit
)
::dest dir
set dest=%base_dir%\FileRecv
if not exist %dest% ( echo sync dir not found
pause
exit
)
:: source dir
set audio=%base_dir%\Audio
set gc=%base_dir%\GroupCollection
set image=%base_dir%\Image
set mc=%base_dir%\MyCollection
set video=%base_dir%\Video

::move file
set dest_other=%dest%\Other
if not exist %dest_other% mkdir %dest_other%
if exist %audio% move /Y %audio% %dest_other%
if exist %gc% move /Y %gc% %dest_other%
if exist %image% move /Y %image% %dest_other%
if exist %mc% move /Y mc %dest_other%
if exist %video% move /Y %video% %dest_other%

::create symbol link
if exist %dest_other%\Audio mklink /D %audio% %dest_other%\Audio
if exist %dest_other%\GroupCollection mklink /D %gc% %dest_other%\GroupCollection
if exist %dest_other%\Image mklink /D %image% %dest_other%\Image
if exist %dest_other%\MyCollection mklink /D %mc% %dest_other%\MyCollection
if exist %dest_other%\Video mklink /D %video% %dest_other%\Video
endlocal
echo "Done"
pause