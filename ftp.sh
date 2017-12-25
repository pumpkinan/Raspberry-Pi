
#!/bin/bash


ftp -n<<!
open 115.29.103.142
user ever ever
passive
binary
cd /data
ls
lcd /root/桌面/data
prompt
mput *
close
bye
!
