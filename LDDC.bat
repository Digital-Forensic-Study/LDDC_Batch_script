:: 24.02.06
:: 비휘발성 제작 로드맵 과제
@echo off

set "result=_result"
set "vol=%result%\_vol"
set "nonvol=%result%\_nonvol"
set "prefetch=%result%\_prefetch"

set "net=%vol%\_net"
set "process=%vol%\_process"
set "logonAccount=%vol%\_logonAccount"

::set "web=%nonvol%\_web"
::set "robocopy=%nonvol%\_robocopy"
::set "cache=%nonvol%\_cache"

:REDO
echo   :          :'''.      :'''.        .'''''.
echo   :          :    '.    :    '.    .'
echo   :          :     :    :     :    :
echo   :          :    .'    :    .'    '.
echo   :.......   :...'      :...'        '.....'
echo.
echo.
echo.
echo --------- (Live Disk Data Collector) ---------
echo 1. all
echo 2. vol
echo 3. nonvol
echo 4. end
echo ----------------------------------------------
set /p inputNum=Enter the number you want to run :

if "%inputNum%"=="1" goto 1 :all
if "%inputNum%"=="2" goto 2 :vol
if "%inputNum%"=="3" goto 3 :nonvol
if "%inputNum%"=="4" goto 4 :program end
goto ERROR

::all
:1
if not exist "%result%" (
    mkdir "%result%"
    echo Created %result% directory. 
    echo START Date: %DATE% Time: %TIME% > _result\log.txt
) else (
    echo %result% directory already exists. passing...
)

if not exist "%prefetch%" (
    mkdir "%prefetch%"
    echo Created %prefetch% directory. 
    echo start prefetch_part at Date: %DATE% Time: %TIME% >> _result\log.txt
    forecopy_handy -p .\_result\_prefetch\
    ::프리패치 파일 리스트들을 뽑아주는 명령어지만 forecopy_handy에서 프리패치 파일 자체들을 뽑아주는 명령어 찾아서 폐기
    ::dir %SystemRoot%\Prefetch > result\_prefetch\prefetch_log.txt
) else (
    echo %prefetch% directory already exists. passing...
)

if not exist "%vol%" (
    mkdir "%vol%"
    echo Created %vol% directory.

    ::net
    if not exist "%net%" (
        mkdir "%net%"
        set "net=%vol%\_net"
        echo start net_part at Date: %DATE% Time: %TIME% >> _result\log.txt
        arp -a > "%net%\arp.txt"
        netstat -ano > "%net%\netstat.txt"
        route print > "%net%\route.txt"
    ) else (
        echo %net% directory already exists. passing...
    )

    ::process
    if not exist "%process%" (
        mkdir "%process%"
        set "process=%vol%\_process"
        echo start process_part at Date: %DATE% Time: %TIME% >> _result\log.txt
        powershell.exe -command ps > "%process%\ps.txt"
        tasklist > "%process%\tasklist"
    ) else (
        echo %process% directory already exists. passing...
    )

    ::logonAccount
    if not exist "%logonAccount%" (
        mkdir "%logonAccount%"
        set "logonAccount=%vol%\_logonAccount"
        echo start logonAccount_part at Date: %DATE% Time: %TIME% >> _result\log.txt
        net user > "%logonAccount%\netuser.txt"
        net localgroup > "%logonAccount%\netlocalgroup.txt"
        net localgroup administrators  > "%logonAccount%\netlocalgroupadministrators.txt"
    ) else (
        echo %logonAccount% directory already exists. passing...
    )

) else (
    echo %vol% directory already exists. passing...
)

if not exist "%nonvol%" (
    mkdir "%nonvol%"
    echo Created %nonvol% directory.
) else (
    echo %nonvol% directory already exists. passing...
)

goto REDO
pause

::vol
:2 
if not exist "%result%" (
    mkdir "%result%"
    echo Created %result% directory. 
    echo START Date: %DATE% Time: %TIME% > _result\log.txt
) else (
    echo %result% directory already exists. passing...
)

if not exist "%vol%" (
    mkdir "%vol%"
    echo Created %vol% directory.
    ::net
    if not exist "%net%" (
        mkdir "%net%"
        set "net=%vol%\_net"
        echo start net_part at Date: %DATE% Time: %TIME% >> _result\log.txt
        arp -a > "%net%\arp.txt"
        netstat -ano > "%net%\netstat.txt"
        route print > "%net%\route.txt"
    ) else (
        echo %net% directory already exists. passing...
    )

    ::process
    if not exist "%process%" (
        mkdir "%process%"
        set "process=%vol%\_process"
        echo start process_part at Date: %DATE% Time: %TIME% >> _result\log.txt
        powershell.exe -command ps > "%process%\ps.txt"
        tasklist > "%process%\tasklist"
    ) else (
        echo %process% directory already exists. passing...
    )

    ::logonAccount
    if not exist "%logonAccount%" (
        mkdir "%logonAccount%"
        set "logonAccount=%vol%\_logonAccount"
        echo start logonAccount_part at Date: %DATE% Time: %TIME% >> _result\log.txt
        net user > "%logonAccount%\netuser.txt"
        net localgroup > "%logonAccount%\netlocalgroup.txt"
        net localgroup administrators  > "%logonAccount%\netlocalgroupadministrators.txt"
    ) else (
        echo %logonAccount% directory already exists. passing...
    )

) else (
    echo %vol% directory already exists. passing...
)

goto REDO
pause

::nonvol
:3
if not exist "%result%" (
    mkdir "%result%"
    echo Created %result% directory. 
    echo START Date: %DATE% Time: %TIME% > _result\log.txt
) else (
    echo %result% directory already exists. passing...
)

if not exist "%prefetch%" (
    mkdir "%prefetch%"
    echo Created %prefetch% directory. 
    echo start prefetch_part at Date: %DATE% Time: %TIME% >> _result\log.txt
    forecopy_handy -p .\_result\_prefetch\
    ::프리패치 파일 리스트들을 뽑아주는 명령어지만 forecopy_handy에서 프리패치 파일 자체들을 뽑아주는 명령어 찾아서 폐기
    ::dir %SystemRoot%\Prefetch > result\_prefetch\prefetch_log.txt
) else (
    echo %prefetch% directory already exists. passing...
)

if not exist "%nonvol%" (
    mkdir "%nonvol%"
    echo Created %nonvol% directory.
) else (
    echo %nonvol% directory already exists. passing...
)

goto REDO
pause

::end
:4
echo Exit the program.
echo END Date: %DATE% Time: %TIME% >> _result\log.txt
exit
pause

:ERROR
echo Invalid input. Check the values you entered.
goto REDO
pause
