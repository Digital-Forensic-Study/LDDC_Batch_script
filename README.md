# LDDC (Live Disk Data Collector) Batch_script
Live Disk Data (vol-nonvol 데이터)를 추출하여 저장하는 배치 스크립트입니다.

###### [24.02.08] prefetch,vol_net, vol_process, vol_logonAccount 명령어추가
###### [24.02.09] vol_logonAccount 명령어추가
###### <s>[24.02.12] nonvol_cache 명령어추가 chrome 웹에서 캐시 데이터 저장위치 에서 하위 디렉토리들과 캐시 데이터를 포함하여 텍스쳐로 저장하는 robocopy 명령어 추가 과정에서 오류 발생하여 제거</s>
###### [24.02.12] vol_net 명령어추가
###### [24.02.12] nonvol_cache 명령어추가
###### [24.02.12] vol_process 명령어추가
###### [24.02.12] vol_logonAccount 명령어추가

<br>

## ※ 주의사항
- 관리자 권한으로 실행하지 않을 시 몇몇의 명령어가 재대로 동작하지 않을 수 있습니다.

- 관리자 권한으로 실행하고 나면 `_result` 파일은 **C:\Windows\System32**에 저장됩니다.

<br>

## Prefetch
<ul>forecopy_handy -p .\_result\_prefetch\</ul>

## Vol
#### net
<ul>ipconfig > "%net%\ipconfig.txt"</ul>
<ul>getmac > "%net%\getmac.txt"</ul>
<ul>net > "%net%\net.txt"</ul>
<ul>netstat -ano > "%net%\netstat.txt"</ul>
<ul>tcpvcon > "%net%\tcpvcon.txt"</ul>
<ul>arp -a > "%net%\arp.txt"</ul>
<ul>route print > "%net%\route.txt"</ul>

#### process
<ul>powershell.exe -command ps > "%process%\ps.txt"</ul>
<ul>tasklist > "%process%\tasklist"</ul>
<ul>handle.exe > "%process%\handle_opened_files.txt"</ul>
<ul>Listdlls.exe > "%process%\Listdlls.txt"</ul>

#### logonAccount
<ul>net session > "%logonAccount%\netsession.txt"</ul>
<ul>net user > "%logonAccount%\netuser.txt"</ul>
<ul>net localgroup > "%logonAccount%\netlocalgroup.txt"</ul>
<ul>net localgroup administrators  > "%logonAccount%\netlocalgroupadministrators.txt"</ul>
<ul>logonsessions.exe > "%logonAccount%\logonsessions.txt"</ul>
<ul>PsLoggedon.exe > "%logonAccount%\PsLoggedon.txt"</ul>

## Nonvol
#### cache
<s><ul>robocopy "%chromeCache%" "%cache%" /s /e /z /copy:DAT /r:3 /w:5 /log:"%cache%\robocopy_chrome_cache.txt"</ul></s>
<ul>robocopy "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Cache" "%cache%" /s /e /z /copy:DAT /r:3 /w:5 /log:"%cache%\robocopy_chrome_cache.txt"</ul>

#### registry
<ul>forecopy_handy.exe -g .\_result\_nonvol\_registry\</ul>

#### mft
<ul>forecopy_handy.exe -m .\_result\_nonvol\_mft\</ul>
