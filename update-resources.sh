#!/bin/bash
# Author: Charlie BROMBERG (Shutdown - @_nwodtuhs)

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NOCOLOR='\033[0m'

function info () {
  echo -e "${BLUE}[*] $@${NOCOLOR}"
}

function debug() {
  echo -e "${YELLOW}[D] $@${NOCOLOR}"
}

function success() {
  echo -e "${GREEN}[+] $@${NOCOLOR}"
}

function prepare_filesystem() {
  info "Preparing filesystem"
  mkdir -p ./windows/
  mkdir -p ./linux/
  mkdir -p ./mac/
  mkdir -p ./cracking/
  mkdir -p ./webshells/
  mkdir -p ./webshells/PHP/
  mkdir -p ./webshells/ASPX/
  mkdir -p ./webshells/JSP/
  mkdir -p ./encrypted_disks/
}

function chkfs() {
  debug "mkdir $@ if not exist"
  mkdir -p $@
}

function add_sysinternals() {
  info "Downloading SysinternalsSuite"
  chkfs "./windows/"
  wget -q -O ./windows/SysinternalsSuite.zip "https://download.sysinternals.com/files/SysinternalsSuite.zip"
  unzip -q -o -d ./windows/SysinternalsSuite ./windows/SysinternalsSuite.zip
  rm ./windows/SysinternalsSuite.zip
}

function add_pspy() {
  info "Downloading pspy"
  chkfs "./linux/pspy/"
  wget -q -O ./linux/pspy/pspy32 "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy32"
  wget -q -O ./linux/pspy/pspy64 "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64"
  wget -q -O ./linux/pspy/pspy32s "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy32s"
  wget -q -O ./linux/pspy/pspy64s "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64s"
}

function add_peass() {
  info "Downloading PEAS Suite"
  chkfs "./linux/linPEAS/"
  wget -q -O ./linux/linPEAS/linpeas.sh "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh"
  wget -q -O ./linux/linPEAS/linpeas_darwin_amd64 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_darwin_amd64"
  wget -q -O ./linux/linPEAS/linpeas_darwin_arm64 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_darwin_arm64"
  wget -q -O ./linux/linPEAS/linpeas_linux_386 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_386"
  wget -q -O ./linux/linPEAS/linpeas_linux_amd64 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_amd64"
  wget -q -O ./linux/linPEAS/linpeas_linux_arm "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_arm"
  wget -q -O ./linux/linPEAS/linpeas_linux_arm64 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_arm64"
  chkfs "./windows/winPEAS/"
  wget -q -O ./windows/winPEAS/winPEAS.bat "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEAS.bat"
  wget -q -O ./windows/winPEAS/winPEASany.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany.exe"
  wget -q -O ./windows/winPEAS/winPEASany_ofs.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe"
  wget -q -O ./windows/winPEAS/winPEASx64.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe"
  wget -q -O ./windows/winPEAS/winPEASx64_ofs.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64_ofs.exe"
  wget -q -O ./windows/winPEAS/winPEASx86.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86.exe"
  wget -q -O ./windows/winPEAS/winPEASx86_ofs.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86_ofs.exe"
}

function add_linux_smart_enumeration() {
  info "Downloading Linux Smart Enumeration"
  chkfs "./linux/"
  wget -q -O ./linux/linux-smart-enumeration.sh "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh"
}

function add_linenum() {
  info "Downloading LinEnum"
  chkfs "./linux/"
  wget -q -O ./linux/LinEnum.sh "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
}

function add_linux_exploit_suggester() {
  info "Downloading Linux Exploit Suggester"
  chkfs "./linux/"
  wget -q -O ./linux/linux-exploit-suggester.sh "https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh"
}

function add_mimikatz() {
  info "Downloading mimikatz"
  chkfs "./windows/"
  wget -q -O ./windows/mimikatz_trunk.zip "https://github.com/gentilkiwi/mimikatz/releases/latest/download/mimikatz_trunk.zip"
  unzip -q -o -d ./windows/mimikatz/ ./windows/mimikatz_trunk.zip
  rm ./windows/mimikatz_trunk.zip
}

function add_sharphound() {
  info "Downloading SharpHound"
  chkfs "./windows/"
  wget -q -O ./windows/SharpHound.exe "https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.exe"
}

function add_juicypotato() {
  info "Downloading JuicyPotato"
  chkfs "./windows/"
  wget -q -O ./windows/JuicyPotato.exe "https://github.com/ohpe/juicy-potato/releases/latest/download/JuicyPotato.exe"
}

function add_nc() {
  info "Downloading nc for Windows"
  chkfs "./windows/"
  wget -q -O ./windows/nc.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/nc.exe"
  info "Downloading nc for Linux"
  chkfs "./linux/"
  wget -q -O ./linux/nc "https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat"
}

function add_spoolsample() {
  info "Downloading SpoolSample"
  chkfs "./windows/"
  wget -q -O ./windows/SpoolSample.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/SpoolSample.exe"
  wget -q -O ./windows/SpoolSample_v4.5_x64.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/SpoolSample_v4.5_x64..exe"
}

function add_diaghub() {
  info "Downloading DiagHub"
  chkfs "./windows/"
  wget -q -O ./windows/diaghub.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/diaghub.exe"
}

function add_lazagne() {
  info "Downloading LaZagne"
  git -C ./ clone -q https://github.com/AlessandroZ/LaZagne
  chkfs "./linux/"
  rm -rf ./linux/LaZagne
  mv ./LaZagne/Linux ./linux/LaZagne
  chkfs "./mac/"
  rm -rf ./mac/LaZagne
  mv ./LaZagne/Mac ./mac/LaZagne
  chkfs "./windows/"
  rm -rf ./windows/LaZagne
  mv ./LaZagne/Windows ./windows/LaZagne
  wget -q -O ./windows/LaZagne/lazagne.exe "https://github.com/AlessandroZ/LaZagne/releases/latest/download/lazagne.exe"
  rm -rf ./LaZagne
}

function add_sublinacl() {
  info "Downloading Sublinacl"
  chkfs "./windows/"
  wget -q -O ./windows/sublinacl.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/sublinacl.exe"
}

function add_plink() {
  info "Downloading plink"
  chkfs "./windows/"
  wget -q -O ./windows/plink32.exe "https://the.earth.li/~sgtatham/putty/latest/w32/plink.exe"
  wget -q -O ./windows/plink64.exe "https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe"
}

function add_deepce() {
  info "Downloading deepce"
  chkfs "./linux/"
  wget -q -O ./linux/deepce.sh "https://github.com/stealthcopter/deepce/raw/master/deepce.sh"
}

function add_webshells() {
  info "Downloading webshells"
  chkfs "./webshells/PHP/wso-webshell/"
  wget -q -O ./webshells/PHP/wso-webshell/wso.php "https://raw.githubusercontent.com/mIcHyAmRaNe/wso-webshell/master/wso.php"
  sed -i 's/fa769dac7a0a94ee47d8ebe021eaba9e/0fc3bcf177377d328c77b2b51b7f3c9b/g' ./webshells/PHP/wso-webshell/wso.php 2>/dev/null || perl -i -pe 's/fa769dac7a0a94ee47d8ebe021eaba9e/0fc3bcf177377d328c77b2b51b7f3c9b/g' ./webshells/PHP/wso-webshell/wso.php
  echo 'exegol4thewin' > ./webshells/PHP/wso-webshell/password.txt
  # Setting password to exegol4thewin
  chkfs "./webshells/ASPX"
  wget -q -O ./webshells/ASPX/webshell.aspx "https://raw.githubusercontent.com/xl7dev/WebShell/master/Aspx/ASPX%20Shell.aspx"
}

function add_ysoserial_net() {
  info "Downloading ysoserial"
  chkfs "./windows/"
  url=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/pwntester/ysoserial.net/releases/latest)
  version=${url##*v}
  wget -q -O ./ysoserial_net.zip "https://github.com/pwntester/ysoserial.net/releases/latest/download/ysoserial-$version.zip"
  unzip -q -d ./windows/ ./ysoserial_net.zip
  rm -rf ./windows/ysoserial.net
  mv ./windows/Release/ ./windows/ysoserial.net
  rm ./ysoserial_net.zip
}

function add_http-put-server() {
  info "Downloading http-put-server for Python3"
  chkfs "./linux/"
  wget -q -O ./linux/http-put-server.py "https://gist.githubusercontent.com/mildred/67d22d7289ae8f16cae7/raw/214c213c9415da18a471d1ed04660022cce059ef/server.py"
}

function add_chisel() {
  info "Downloading Chisel"
  chkfs "./windows/chisel/"
  chkfs "./linux/chisel/"
  url=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/jpillora/chisel/releases/latest)
  version=${url##*v}
  wget -qO- "https://github.com/jpillora/chisel/releases/latest/download/chisel_${version}_windows_amd64.gz" | gzip -d > ./windows/chisel/chisel64.exe
  wget -qO- "https://github.com/jpillora/chisel/releases/latest/download/chisel_${version}_windows_386.gz" | gzip -d > ./windows/chisel/chisel32.exe
  wget -qO- "https://github.com/jpillora/chisel/releases/latest/download/chisel_${version}_linux_amd64.gz" | gzip -d > ./linux/chisel/chisel64
  wget -qO- "https://github.com/jpillora/chisel/releases/latest/download/chisel_${version}_linux_386.gz" | gzip -d > ./linux/chisel/chisel32
}

function update_submodules() {
  info "Updating git submodules"
  git submodule --quiet update --init --recursive --remote --merge
}

# Package dedicated to the download of resources
function add_resources() {
  add_sysinternals
  add_pspy
  add_peass
  add_linux_smart_enumeration
  add_linenum
  add_linux_exploit_suggester
  add_mimikatz
  add_sharphound
  add_juicypotato
  add_nc
  add_spoolsample
  add_diaghub
  add_lazagne
  add_sublinacl
  add_plink
  add_deepce
  add_webshells
  add_ysoserial_net
  add_http-put-server
  add_chisel
  update_submodules
}

add_resources
success "Done updating Exegol-resources"
