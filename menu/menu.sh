#!/bin/bash
22

33
BURIQ () {
44
# Mengunduh daftar register dari URL baru dan menyimpannya ke dalam file sementara
55
curl -sS https://raw.githubusercontent.com/scriswan/premiumsc/main/register > /root/tmp
66

77
# Mendapatkan IP pengguna saat ini
88
MYIP=$(curl -sS ipv4.icanhazip.com)
99

1010
# Mencari entri yang memiliki IP yang sama dengan pengguna saat ini
1111
entry=$(grep -E " $MYIP" /root/tmp)
1212

1313
# Jika entri ditemukan, proses tanggal kedaluwarsa
1414
if [[ -n "$entry" ]]; then
1515
# Mengambil nama pengguna dan tanggal kedaluwarsa dari entri tersebut
1616
user=$(echo "$entry" | awk '{print $2}')
1717
exp=$(echo "$entry" | awk '{print $3}')
1818

1919
# Mengonversi tanggal kedaluwarsa dan tanggal hari ini ke detik sejak epoch
2020
d1=$(date -d "$exp" +%s)
2121
d2=$(date +%s) # Hari ini
2222

2323
# Menghitung selisih hari antara hari ini dan tanggal kedaluwarsa
2424
exp2=$(( (d1 - d2) / 86400 ))
2525

2626
# Jika waktu habis (expired)
2727
if [[ "$exp2" -le "0" ]]; then
2828
echo $user > /etc/.$user.ini
2929
else
3030
rm -f /etc/.$user.ini > /dev/null 2>&1
3131
fi
3232
fi
3333

3434
# Menghapus file sementara
3535
rm -f /root/tmp
3636
}
3737

3838
# Mendapatkan IP pengguna saat ini
3939
MYIP=$(curl -sS ipv4.icanhazip.com)
4040

4141
# Mendapatkan nama berdasarkan IP yang sesuai di file register
4242
Name=$(curl -sS https://raw.githubusercontent.com/scriswan/premiumsc/main/register | grep $MYIP | awk '{print $2}')
4343

4444
# Menyimpan nama ke file .ini untuk pemeriksaan izin
4545
echo $Name > /usr/local/etc/.$Name.ini
4646
CekOne=$(cat /usr/local/etc/.$Name.ini)
4747

4848
Bloman () {
4949
# Memeriksa apakah file izin untuk user ada
5050
if [ -f "/etc/.$Name.ini" ]; then
5151
CekTwo=$(cat /etc/.$Name.ini)
5252

5353
# Memeriksa apakah nama pada file izin cocok
5454
if [ "$CekOne" = "$CekTwo" ]; then
5555
res="Expired"
5656
fi
5757
else
5858
res="Permission Accepted..."
5959
fi
6060
}
6161

6262
PERMISSION () {
6363
# Mendapatkan IP pengguna
6464
MYIP=$(curl -sS ipv4.icanhazip.com)
6565

6666
# Memeriksa apakah IP ada di daftar register
6767
IZIN=$(curl -sS https://raw.githubusercontent.com/scriswan/premiumsc/main/register | awk '{print $4}' | grep $MYIP)
6868

6969
if [ "$MYIP" = "$IZIN" ]; then
7070
Bloman
7171
else
7272
res="Permission Denied!"
7373
fi
7474

7575
BURIQ
7676
}
7777

7878
# Menjalankan fungsi PERMISSION untuk memulai
7979
PERMISSION
8080
if [ "$res" = "Expired" ]; then
8181
Exp="\e[36mExpired\033[0m"
8282
else
8383
Exp=$(curl -sS https://raw.githubusercontent.com/scriswan/premiumsc/main/register | grep $MYIP | awk '{print $3}')
8484
fi
8585
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
8686
let vla=$vlx/2
8787
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
8888
let vma=$vmc/2
8989
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
9090
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
9191
let tra=$trx/2
9292
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
9393
let ssa=$ssx/2
9494
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
9595
BIBlack='\033[1;90m' # Black
9696
BIRed='\033[1;91m' # Red
9797
BIGreen='\033[1;92m' # Green
9898
BIYellow='\033[1;93m' # Yellow
9999
BIBlue='\033[1;94m' # Blue
100100
BIPurple='\033[1;95m' # Purple
101101
BICyan='\033[1;96m' # Cyan
102102
BIWhite='\033[1;97m' # White
103103
UWhite='\033[4;37m' # White
104104
On_IPurple='\033[0;105m' #
105105
On_IRed='\033[0;101m'
106106
IBlack='\033[0;90m' # Black
107107
IRed='\033[0;91m' # Red
108108
IGreen='\033[0;92m' # Green
109109
IYellow='\033[0;93m' # Yellow
110110
IBlue='\033[0;94m' # Blue
111111
IPurple='\033[0;95m' # Purple
112112
ICyan='\033[0;96m' # Cyan
113113
IWhite='\033[0;97m' # White
114114
NC='\e[0m'
115115
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
116116
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
117117
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
118118
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
119119
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
120120
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
121121
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
122122
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
123123
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
124124
clear
125125
tram=$( free -h | awk 'NR==2 {print $2}' )
126126
uram=$( free -h | awk 'NR==2 {print $3}' )
127127
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
128128
CITY=$(curl -s ipinfo.io/city )
129129
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
130130
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
131131
cpu_usage+=" %"
132132
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
133133
totalram=$(($total_ram/1024))
134134
persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
135135
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"
136136
export LANG='en_US.UTF-8'
137137
export LANGUAGE='en_US.UTF-8'
138138
export RED='\033[0;31m'
139139
export GREEN='\033[0;32m'
140140
export YELLOW='\033[0;33m'
141141
export BLUE='\033[0;34m'
142142
export PURPLE='\033[0;35m'
143143
export CYAN='\033[0;36m'
144144
export LIGHT='\033[0;37m'
145145
export NC='\033[0m'
146146
export EROR="[${RED} EROR ${NC}]"
147147
export INFO="[${YELLOW} INFO ${NC}]"
148148
export OKEY="[${GREEN} OKEY ${NC}]"
149149
export PENDING="[${YELLOW} PENDING ${NC}]"
150150
export SEND="[${YELLOW} SEND ${NC}]"
151151
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
152152
export BOLD="\e[1m"
153153
export WARNING="${RED}\e[5m"
154154
export UNDERLINE="\e[4m"
155155
clear
156156
clear && clear && clear
157157
clear;clear;clear
158158
cek=$(service ssh status | grep active | cut -d ' ' -f5)
159159
if [ "$cek" = "active" ]; then
160160
stat=-f5
161161
else
162162
stat=-f7
163163
fi
164164
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
165165
if [ "$ssh" = "active" ]; then
166166
ressh="${green}ON${NC}"
167167
else
168168
ressh="${red}OFF${NC}"
169169
fi
170170
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
171171
if [ "$sshstunel" = "active" ]; then
172172
resst="${green}ON${NC}"
173173
else
174174
resst="${red}OFF${NC}"
175175
fi
176176
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
177177
if [ "$sshws" = "active" ]; then
178178
ressshws="${green}ON${NC}"
179179
else
180180
ressshws="${red}OFF${NC}"
181181
fi
182182
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
183183
if [ "$ngx" = "active" ]; then
184184
resngx="${green}ON${NC}"
185185
else
186186
resngx="${red}OFF${NC}"
187187
fi
188188
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
189189
if [ "$dbr" = "active" ]; then
190190
resdbr="${green}ON${NC}"
191191
else
192192
resdbr="${red}OFF${NC}"
193193
fi
194194
v2r=$(service xray status | grep active | cut -d ' ' $stat)
195195
if [ "$v2r" = "active" ]; then
196196
resv2r="${green}ON${NC}"
197197
else
198198
resv2r="${red}OFF${NC}"
199199
fi
200200
function addhost(){
201201
clear
202202
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
203203
echo ""
204204
read -rp "Domain/Host: " -e host
205205
echo ""
206206
if [ -z $host ]; then
207207
echo "????"
208208
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
209209
read -n 1 -s -r -p "Press any key to back on menu"
210210
setting-menu
211211
else
212212
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
213213
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
214214
echo "Dont forget to renew cert"
215215
echo ""
216216
read -n 1 -s -r -p "Press any key to back on menu"
217217
menu
218218
fi
219219
}
220220
function genssl(){
221221
clear
222222
systemctl stop nginx
223223
domain=$(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)
224224
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
225225
if [[ ! -z "$Cek" ]]; then
226226
sleep 1
227227
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek "
228228
systemctl stop $Cek
229229
sleep 2
230230
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek "
231231
sleep 1
232232
fi
233233
echo -e "[ ${green}INFO${NC} ] Starting renew cert... "
234234
sleep 2
235235
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
236236
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
237237
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
238238
echo -e "[ ${green}INFO${NC} ] Renew cert done... "
239239
sleep 2
240240
echo -e "[ ${green}INFO${NC} ] Starting service $Cek "
241241
sleep 2
242242
echo $domain > /etc/xray/domain
243243
systemctl restart xray
244244
systemctl restart nginx
245245
echo -e "[ ${green}INFO${NC} ] All finished... "
246246
sleep 0.5
247247
echo ""
248248
read -n 1 -s -r -p "Press any key to back on menu"
249249
menu
250250
}
251251
# Date
252252
DATE=$(date +'%d %B %Y')
253253
datediff() {
254254
d1=$(date -d "$1" +%s)
255255
d2=$(date -d "$2" +%s)
256256
}
257257
mai="datediff "$Exp" "$DATE""
258258
export sem=$( curl -s https://raw.githubusercontent.com/scriswan/premiumsc/main/version)
259259
export pak=$( cat /home/.ver)
260260
IPVPS=$(curl -s ipinfo.io/ip )
261261
clear
262262
echo -e "$(figlet "")" | lolcat
263263
echo -e "${BICyan} ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬${NC}"
264-
echo -e "${BICyan} │ ${BIWhite}${UWhite}𝕊ℂ ℙℝ𝔼𝕄𝕀𝕌𝕄 𝕂𝔼𝕐ℝ𝕀𝕊 𝕍ℙℕ𝕊𝕋𝕆ℝ𝔼${NC}"
264+
echo -e "${BICyan} │ ${BIWhite}${UWhite}𝕊ℂ ℙℝ𝔼𝕄𝕀𝕌𝕄 𝕂𝔼𝕐ℝ𝕀𝕊 𝕍ℙℕ𝕊𝕋𝕆ℝ𝔼${NC}"
265265
echo -e "${BICyan} ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬${NC}"
266266
echo -e "${BICyan} │"
267267
echo -e "${BICyan} │ ${BICyan}OS : ${BIYellow}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )${NC}"
268268
echo -e "${BICyan} │ ${BICyan}NS : ${BIYellow}$(cat /root/nsdomain)${NC}"
269269
echo -e "${BICyan} │ ${BICyan}DOMAIN : ${BIYellow}$(cat /etc/xray/domain)${NC}"
270270
echo -e "${BICyan} │ ${BICyan}RAM & CPU : ${BIYellow}$totalram MB / $cpu_usage${NC}"
271271
echo -e "${BICyan} │ ${BICyan}SWAP RAM : ${BIYellow}$uram / $tram MB${NC}"
272272
echo -e "${BICyan} │ ${BICyan}IP VPS : ${BIYellow}$IPVPS${NC}"
273273
echo -e "${BICyan} │ ${BICyan}REBOOT : ${BIYellow}jam 02:00 malam${NC}"
274274
echo -e "${BICyan} │ ${BICyan}TELEGRAM : ${BIYellow}@Riswanvpnstore${NC}"
275275
echo -e "${BICyan} ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬${NC}"
276276
echo -e "${BICyan} │ ${Blue}[SSH][$ssh1] [VMESS][$vma] [VLESS][$vla] [TROJAN][$tra] $NC"
277277
echo -e "${BICyan} ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬${NC}"
278278
echo -e " ${BICyan}│ [SSH]${NC}[$ressh]"" ${BICyan} [NGINX]${NC}[$resngx]"" ${BICyan} [XRAY]${NC}[$resv2r]"" ${BICyan} [TROJAN]${NC}[$resv2r]"
279279
echo -e " ${BICyan}│ [STUNNEL]${NC}[$resst]" "${BICyan} [DROPBEAR]${NC}[$resdbr]" "${BICyan} [SSH-WS]${NC}[$ressshws]"
280280
echo -e "${BICyan} ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬${NC}"
281281
echo -e "${BICyan} │ ${BICyan}[${BIWhite}01${BICyan}] SSH ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} [${BIWhite}08${BICyan}] ADD-HOST ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} │${NC}"
282282
echo -e "${BICyan} │ ${BICyan}[${BIWhite}02${BICyan}] VMESS ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} [${BIWhite}09${BICyan}] RUNNING ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} │${NC}"
283283
echo -e "${BICyan} │ ${BICyan}[${BIWhite}03${BICyan}] VLESS ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} [${BIWhite}10${BICyan}] INSTALL UDP ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} │${NC}"
284284
echo -e "${BICyan} │ ${BICyan}[${BIWhite}04${BICyan}] TROJAN ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} [${BIWhite}11${BICyan}] INSTALL BOT ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} │${NC}"
285285
echo -e "${BICyan} │ ${BICyan}[${BIWhite}05${BICyan}] SETING ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} [${BIWhite}12${BICyan}] BANDWITH ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} │${NC}"
286286
echo -e "${BICyan} │ ${BICyan}[${BIWhite}06${BICyan}] TRIALL ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} [${BIWhite}13${BICyan}] MENU THEME ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} │${NC}"
287287
echo -e "${BICyan} │ ${BICyan}[${BIWhite}07${BICyan}] BACKUP ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} [${BIWhite}14${BICyan}] UPDATE SCRIPT ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan} │${NC}"
288288
echo -e "${BICyan} ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬${NC}"
289289
echo -e "${BICyan} ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬${NC}"
290290
echo -e "${BICyan} │$NC Version Script : $(cat /opt/.ver) Last Update ${NC}"
291291
echo -e "${BICyan} │${GREEN} Username :\033[1;36m $Name \e[0m"
292292
echo -e "${BICyan} │${NC} Expired script :${NC} $exp ${NC}/${GREEN} $exp2${NC} Days${NC}"
293293
echo -e "${BICyan} ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬${NC}"
294294
echo -e ""
295295
read -p " Select angka >>> : " opt
296296
echo -e ""
297297
case $opt in
298298
1) clear ; menu-ssh ;;
299299
2) clear ; menu-vmess ;;
300300
3) clear ; menu-vless ;;
301301
4) clear ; menu-trojan ;;
302302
5) clear ; menu-set ;;
303303
6) clear ; menu-trial ;;
304304
7) clear ; menu-backup ;;
305305
8) clear ; add-host ;;
306306
9) clear ; running ;;
307307
10) clear ; clear ; wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp ;;
308308
11) clear ; xolpanel ;;
309309
12) clear ; bw ;;
310310
13) clear ; menu-theme ;;
311311
14) clear ; update ;;
312312
0) clear ; menu ;;
