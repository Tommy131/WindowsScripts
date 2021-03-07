@echo off
chcp 65001
color 6
set version=v1.0.2
set prefix=[定时关机任务]
set DAILY_TIME=03:00
set /a SHUTDOWN_TIME=5*60
title 定时自动关机脚本%version% By HanskiJay

echo ----------------------------------------
echo 正在运行 '自动关机脚本%version%' BY HanskiJay
echo ----------------------------------------

:begin
set input=
set res=false
set /p input=%prefix%请选择需要执行的指令或按回车键退出此脚本(help/install/uninstall/start/cancel/exit):
echo .
echo .

if %input%==help       set res=true
if %input%==install    set res=true
if %input%==uninstall  set res=true
if %input%==start      set res=true
if %input%==cancel     set res=true
if %input%==exit       set res=true

if %res%==true (
    goto %input%
) else (
    echo %prefix% 无效的指令 '%input%'. 请重新输入!
    goto begin
)


:help
echo "install:   将自动关机任务添加到Windows计划管理列表内"
echo "uninstall: 从Windows计划管理列表中删除自动关机任务"
echo "start:     使用此指令后将会在 %SHUTDOWN_TIME% 秒后定时关机"
echo "cancel:    若存在定时关机任务, 将会取消定时关机任务"
echo "exit:      退出脚本"
goto begin


:install
schtasks /create /tn shutdownTask /tr "shutdown -s -t %SHUTDOWN_TIME%" /sc DAILY /st %DAILY_TIME% /f
echo .
echo .
echo %prefix% 已成功将定时关机任务添加到Windows计划管理列表中.
goto begin


:uninstall
schtasks /delete /tn shutdownTask /f
echo .
echo .
echo %prefix% 已成功删除定时关机任务.
goto begin


:start
shutdown -s -t %SHUTDOWN_TIME%
echo .
echo .
echo %prefix% 你的电脑将在 %SHUTDOWN_TIME% 秒后自动关机!
goto begin


:cancel
shutdown -a
echo .
echo .
echo %prefix% 已取消关机计划.
goto begin


:exit
echo %prefix% 脚本已终止, 请按任意键退出!
pause
exit
