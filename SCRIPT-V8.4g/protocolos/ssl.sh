#!/bin/bash
#25/01/2021 by @Kalix1
clear
clear
check_keyoficial () {
  IP=$(wget -qO- ifconfig.me)
  IP2="$IP"
  permited=$(curl -sSL "https://www.dropbox.com/s/a7551062y9ge8bd/RegKeyID")
  [[ $(echo $permited|grep "$IP2") = "" ]] && {
  clear && clear
  echo 'echo -e "\n\n\033[1;91m==============================================================\n ¡KEY BANNED! CONTACT YOUR SELLER\n==============================================================\n\n" ' > /usr/bin/vps-mx && chmod +x /usr/bin/vps-mx  
  echo 'echo -e "\n\n\033[1;91m==============================================================\n ¡KEY BANNED! CONTACT YOUR SELLER\n==============================================================\n\n" ' > /usr/bin/VPS-MX && chmod +x /usr/bin/VPS-MX
  sleep 5s
  exit && exit 
  } || {
  echo "OK-OFI-@Kalix1" > /usr/bin/lickal
  }
  exit && exit && exit
}
check_keyoficial&
SCPdir="/etc/VPS-MX"
SCPfrm="${SCPdir}/herramientas" && [[ ! -d ${SCPfrm} ]] && exit
SCPinst="${SCPdir}/protocolos"&& [[ ! -d ${SCPinst} ]] && exit
declare -A cor=( [0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;31m" [3]="\033[1;33m" [4]="\033[1;32m" )
dirapache="/usr/local/lib/ubuntn/apache/ver" && [[ ! -d ${dirapache} ]] && exit
mportas () {
unset portas
portas_var=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND" | grep "LISTEN")
while read port; do
var1=$(echo $port | awk '{print $1}') && var2=$(echo $port | awk '{print $9}' | awk -F ":" '{print $2}')
[[ "$(echo -e $portas|grep "$var1 $var2")" ]] || portas+="$var1 $var2\n"
done <<< "$portas_var"
i=1
echo -e "$portas"
}

fun_bar () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne " \033[1;33m["
   for((i=0; i<20; i++)); do
   echo -ne "\033[1;31m##"
   sleep 0.5
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1
tput dl1
done
echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m OK \033[0m"
sleep 1s
}
ssl_stunel () {
[[ $(mportas|grep stunnel4|head -1) ]] && {
echo -e "\033[1;33m $(fun_trans  "Stopping Stunnel")"
msg -bar
service stunnel4 stop > /dev/null 2>&1
fun_bar "apt-get purge  stunnel4 -y"
msg -bar
echo -e "\033[1;33m $(fun_trans  "Stopped Successfully!")"
msg -bar
return 0
}
echo -e "\033[1;32m $(fun_trans  "              SSL INSTALLER By  R A Z O R ™")"
msg -bar
echo -e "\033[1;33m $(fun_trans  "Select an Internal Redirection Port")"
echo -e "\033[1;33m $(fun_trans  "An SSH/DROPBEAR/SQUID/OPENVPN/PYTHON port")"
msg -bar
         while true; do
         echo -e "\033[1;37m"
         read -p " Local-Port: " portx
		 echo ""
         if [[ ! -z $portx ]]; then
             if [[ $(echo $portx|grep [0-9]) ]]; then
                [[ $(mportas|grep $portx|head -1) ]] && break || echo -e "\033[1;31m Invalid Port"
             fi
         fi
         done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
echo -e "\033[1;33m   WHICH PORT DO YOU WANT TO INSTALL SSL"
msg -bar
    while true; do
	echo -e "\033[1;37m"
    read -p " Listen-SSL: " SSLPORT
	echo ""
    [[ $(mportas|grep -w "$SSLPORT") ]] || break
    echo -e "\033[1;33m This Port is in Use"
    unset SSLPORT
    done
msg -bar
echo -e "\033[1;33m $(fun_trans  "Installing SSL")"
msg -bar
fun_bar "apt-get install stunnel4 -y"
apt-get install stunnel4 -y > /dev/null 2>&1
echo -e "client = no\n[SSL]\ncert = /etc/stunnel/stunnel.pem\n#CAfile = /etc/stunnel/ca_bundle.crt\naccept = ${SSLPORT}\nconnect = 127.0.0.1:${portx}" > /etc/stunnel/stunnel.conf
####Coreccion2.0##### 
openssl genrsa -out stunnel.key 2048 > /dev/null 2>&1

# (echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "@vpsmx" )|openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt > /dev/null 2>&1

openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt

cat stunnel.crt stunnel.key > stunnel.pem 

mv stunnel.pem /etc/stunnel/
######-------
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart > /dev/null 2>&1
msg -bar
echo -e "\033[1;33m $(fun_trans  "INSTALLED SUCCESSFULLY")"
msg -bar
rm -rf /etc/ger-frm/stunnel.crt > /dev/null 2>&1
rm -rf /etc/ger-frm/stunnel.key > /dev/null 2>&1
rm -rf /root/stunnel.crt > /dev/null 2>&1
rm -rf /root/stunnel.key > /dev/null 2>&1
return 0
}
SPR &
ssl_stunel_2 () {
echo -e "\033[1;32m $(fun_trans  "             ADD MORE SSL PORTS")"
msg -bar
echo -e "\033[1;33m $(fun_trans  "Select an Internal Redirection Port")"
echo -e "\033[1;33m $(fun_trans  "An SSH/DROPBEAR/SQUID/OPENVPN/PYTHON port")"
msg -bar
         while true; do
         echo -ne "\033[1;37m"
         read -p " Local-Port: " portx
		 echo ""
         if [[ ! -z $portx ]]; then
             if [[ $(echo $portx|grep [0-9]) ]]; then
                [[ $(mportas|grep $portx|head -1) ]] && break || echo -e "\033[1;31m $(fun_trans  "Invalid Port")"
             fi
         fi
         done
msg -bar
DPORT="$(mportas|grep $portx|awk '{print $2}'|head -1)"
echo -e "\033[1;33m $(fun_trans  "WHICH PORT DO YOU WANT TO INSTALL SSL")"
msg -bar
    while true; do
	echo -ne "\033[1;37m"
    read -p " Listen-SSL: " SSLPORT
	echo ""
    [[ $(mportas|grep -w "$SSLPORT") ]] || break
    echo -e "\033[1;33m $(fun_trans  "This Port is in Use")"
    unset SSLPORT
    done
msg -bar
echo -e "\033[1;33m $(fun_trans  "Installing SSL")"
msg -bar
fun_bar "apt-get install stunnel4 -y"
echo -e "client = no\n[SSL+]\ncert = /etc/stunnel/stunnel.pem\n#CAfile = /etc/stunnel/ca_bundle.crt\naccept = ${SSLPORT}\nconnect = 127.0.0.1:${DPORT}" >> /etc/stunnel/stunnel.conf
######-------
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
service stunnel4 restart > /dev/null 2>&1
msg -bar
echo -e "${cor[4]}            INSTALLED SUCCESSFULLY"
msg -bar
rm -rf /etc/ger-frm/stunnel.crt > /dev/null 2>&1
rm -rf /etc/ger-frm/stunnel.key > /dev/null 2>&1
rm -rf /root/stunnel.crt > /dev/null 2>&1
rm -rf /root/stunnel.key > /dev/null 2>&1
return 0
}
ssl_stunel_3 () {
clear
clear
msg -bar
msg -tit
echo -e "\033[1;93m      SSL + PYDIREC  \033[1;94m By  R A Z O R ™"
msg -bar
echo -e "\033[1;91m You should have Port 22 (SSH) and Ports 80 (PYTHON PROXY) and 443 (SSL) free"
msg -bar

 install_python(){ 
 echo -e "\033[1;97m Activating Python Direct 80\n"
 fun_bar "apt-get install python -y" 
 sleep 3  
 screen -dmS pydic-80 python ${SCPinst}/python.py 80 "VPS-MX" && echo "80 VPS-MX" >> /etc/VPS-MX/PySSL.log
 msg -bar
 } 
 install_ssl(){  
 echo -e "\033[1;97m Activating SSL services 80 ► 443\n"
 fun_bar "apt-get install stunnel4 -y" 
 apt-get install stunnel4 -y > /dev/null 2>&1 
 echo -e "client = no\n[SSL]\ncert = /etc/stunnel/stunnel.pem\n#CAfile = /etc/stunnel/ca_bundle.crt\naccept = 443\nconnect = 127.0.0.1:80" > /etc/stunnel/stunnel.conf 
 openssl genrsa -out stunnel.key 2048 > /dev/null 2>&1 
 #(echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "mx" ; echo "@vpsmx" )|openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt > /dev/null 2>&1
 openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt  
 cat stunnel.crt stunnel.key > stunnel.pem   
 mv stunnel.pem /etc/stunnel/ 
 ######------- 
 sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4 
 service stunnel4 restart > /dev/null 2>&1  
 rm -rf /root/stunnel.crt > /dev/null 2>&1 
 rm -rf /root/stunnel.key > /dev/null 2>&1 
 } 
install_python 
install_ssl 
msg -bar
echo -e "${cor[4]}               INSTALLATION COMPLETE"
msg -bar
}
clear
clear
msg -bar
msg -bar3
msg -tit
echo -e "${cor[3]}       SSL MONO AND MULTI INSTALLER By  R A Z O R ™"
msg -bar
echo -e "${cor[1]}            Choose an option"
msg -bar
echo -e "${cor[4]} 1).-\033[1;37m START | STOP SSL "
echo -e "${cor[4]} 2).-\033[1;37m ADD SSL PORTS   "
msg -bar
echo -e "${cor[4]} 3).-\033[1;37m SSL+WS (AUTO CONFIGURACION)   "
echo -ne ""$(msg -bar)"   \n$(msg -verd " 0).-") $(msg -verm2 "==>")" &&  msg -bra  "  \e[97m\033[1;41m RETURN \033[1;37m"
msg -bar
echo -ne "\033[1;37mType only the number according to your answer: "


read opcao
case $opcao in
1)
msg -bar
ssl_stunel
;;
2)
msg -bar
ssl_stunel_2
;;
3)
msg -bar
ssl_stunel_3
msg -ne "Enter to Continue" && read enter
/etc/VPS-MX/protocolos/ssl.sh
;;
4)
exit
;;
esac