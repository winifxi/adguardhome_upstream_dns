rm /opt/AdGuardHome/upstream_dns_file

curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt"  >> /opt/AdGuardHome/upstream_dns_file

sed "s/^full://g;/^regexp:.*$/d;s/^/[\//g;s/$/\/]tls:\/\/120.53.53.53/g" -i /opt/AdGuardHome/upstream_dns_file 
#echo "[/123456.xyz/]tls://120.53.53.53" >> /opt/AdGuardHome/upstream_dns_file
#echo "[/rfi.fr/]tcp://8.8.8.8" >> /opt/AdGuardHome/upstream_dns_file
#echo "tcp://8.8.8.8" >> /opt/AdGuardHome/upstream_dns_file
#echo "tcp://8.8.4.4" >> /opt/AdGuardHome/upstream_dns_file

echo "https://public.dns.iij.jp/dns-query" >> /opt/AdGuardHome/upstream_dns_file
echo "https://doh.opendns.com/dns-query" >> /opt/AdGuardHome/upstream_dns_file
echo "https://doh.dns.sb/dns-query" >> /opt/AdGuardHome/upstream_dns_file
echo "https://dns.twnic.tw/dns-query" >> /opt/AdGuardHome/upstream_dns_file
echo "tls://fi.dot.dns.snopyta.org" >> /opt/AdGuardHome/upstream_dns_file
echo "https://dns.cloudflare.com/dns-query" >> /opt/AdGuardHome/upstream_dns_file


systemctl restart AdGuardHome.service

