# adguardhome_upstream_dns
adguardhome通过设置上游dns的方式进行分流

用到了 https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt 规则   
命中的将使用 tls://120.53.53.53 查询    
没中的 https://public.dns.iij.jp/dns-query  https://doh.opendns.com/dns-query 等查询

假定AdGuardHome安装在/opt/AdGuardHome中，不在的话，下面的命令和update.sh里面的文件路径要做些修改

# 使用方法
1.复制 upstream_dns_file 和 update.sh 到 /opt/AdGuardHome/ 中 

2.修改配置文件文件AdGuardHome.yaml 设置上游dns的配置文件     
使用这条命令修改：   
sed -i "s/^  upstream_dns_file.*$/  upstream_dns_file: \"\/opt\/AdGuardHome\/upstream_dns_file\"/g" /opt/AdGuardHome/AdGuardHome.yaml   
或手动修改/opt/AdGuardHome/AdGuardHome.yaml 的 upstream_dns_file项，改为 upstream_dns_file: "/opt/AdGuardHome/upstream_dns_file"   

3.重启   
systemctl restart AdGuardHome.service

更新规则   
bash  /opt/AdGuardHome/update.sh

# 感谢 
Loyalsoldier/v2ray-rules-dat   https://github.com/Loyalsoldier/v2ray-rules-dat
