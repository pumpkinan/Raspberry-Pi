
########    10M=10485760
#######          filesize need to be changed
cd /root/桌面

tshark -w a -a filesize:20 "tcp dst port 80"

nohup tshark -r a -V -x "http.request.method=="POST"" >>out 2>&1 &

mv out /root/桌面/data
 
cd data

sleep 2

nohup grep 'Encoded' out -A 13 >>$(date -d "today" +"%Y%m%d_%H%M%S") 2>&1



