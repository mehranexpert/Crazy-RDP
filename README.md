# Crazy-RDP
Remote Desktop Bruteforce

The script automatically scans the address list, and then selecting the method and starting busting pair login / password.

The script is tuned for Kali linux 2.0 system.

To work correctly, the script requires the establishment; masscan, curl and hydra by van Hauser.

The default path is registered in the script:

a. /home/admin/opt/web/rdp_brute/open3389

b. /home/admin/opt/web/rdp_brute/users

c. /home/admin/opt/web/rdp_brute/dictionary/pass

So if you have any others, do in a word processor search and replace on your own.

The current version is 1.02. Added ability to select the method of sorting the pair login / password. Fixed a crash bug when selecting a script of some countries from the list. Fixed a bug with incorrect paths.

Setting

'git clone https://github.com/getdrive/Lazy-RDP' 
Starting from the folder with the script through the terminal

a. chmod +x rdp_brute.sh

b. ./rdp_brute.sh
