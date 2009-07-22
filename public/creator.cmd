@echo off<%= "\r\n" -%>
<%= "\r\n" -%>
set workdir=%TEMP%\creator<%= "\r\n" -%>
if NOT EXIST %workdir% call mkdir %workdir%<%= "\r\n" -%>
<%= "\r\n" -%>
curl -c %workdir%\cookies.txt -sS "192.168.1.131:3000/queries/new?prayer=%1&name=%2" > %workdir%\client.cmd<%= "\r\n" -%>
<%= "\r\n" -%>
call %workdir%\client.cmd %1 %2 %3<%= "\r\n" -%>
del %workdir%\client.cmd<%= "\r\n" -%>
