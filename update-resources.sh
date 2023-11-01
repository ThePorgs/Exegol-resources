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
  wget -O ./windows/SysinternalsSuite.zip "https://download.sysinternals.com/files/SysinternalsSuite.zip"
  unzip -o -d ./windows/SysinternalsSuite ./windows/SysinternalsSuite.zip
  rm -v ./windows/SysinternalsSuite.zip
}

function add_pspy() {
  info "Downloading pspy"
  chkfs "./linux/pspy/"
  wget -O ./linux/pspy/pspy32 "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy32"
  wget -O ./linux/pspy/pspy64 "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64"
  wget -O ./linux/pspy/pspy32s "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy32s"
  wget -O ./linux/pspy/pspy64s "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64s"
}

function add_peass() {
  info "Downloading PEAS Suite"
  chkfs "./linux/linPEAS/"
  wget -O ./linux/linPEAS/linpeas.sh "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh"
  wget -O ./linux/linPEAS/linpeas_darwin_amd64 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_darwin_amd64"
  wget -O ./linux/linPEAS/linpeas_darwin_arm64 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_darwin_arm64"
  wget -O ./linux/linPEAS/linpeas_linux_386 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_386"
  wget -O ./linux/linPEAS/linpeas_linux_amd64 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_amd64"
  wget -O ./linux/linPEAS/linpeas_linux_arm "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_arm"
  wget -O ./linux/linPEAS/linpeas_linux_arm64 "https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas_linux_arm64"
  chkfs "./windows/winPEAS/"
  wget -O ./windows/winPEAS/winPEAS.bat "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEAS.bat"
  wget -O ./windows/winPEAS/winPEASany.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany.exe"
  wget -O ./windows/winPEAS/winPEASany_ofs.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe"
  wget -O ./windows/winPEAS/winPEASx64.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe"
  wget -O ./windows/winPEAS/winPEASx64_ofs.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64_ofs.exe"
  wget -O ./windows/winPEAS/winPEASx86.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86.exe"
  wget -O ./windows/winPEAS/winPEASx86_ofs.exe "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx86_ofs.exe"
}

function add_linux_smart_enumeration() {
  info "Downloading Linux Smart Enumeration"
  chkfs "./linux/"
  wget -O ./linux/linux-smart-enumeration.sh "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh"
}

function add_linenum() {
  info "Downloading LinEnum"
  chkfs "./linux/"
  wget -O ./linux/LinEnum.sh "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
}

function add_linux_exploit_suggester() {
  info "Downloading Linux Exploit Suggester"
  chkfs "./linux/"
  wget -O ./linux/linux-exploit-suggester.sh "https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh"
}

function add_mimikatz() {
  info "Downloading mimikatz"
  chkfs "./windows/"
  wget -O ./windows/mimikatz_trunk.zip "https://github.com/gentilkiwi/mimikatz/releases/latest/download/mimikatz_trunk.zip"
  unzip -o -d ./windows/mimikatz/ ./windows/mimikatz_trunk.zip
  rm -v ./windows/mimikatz_trunk.zip
}

function add_sharphound() {
  info "Downloading SharpHound"
  chkfs "./windows/"
  wget -O ./windows/SharpHound.exe "https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.exe"
}

function add_juicypotato() {
  info "Downloading JuicyPotato"
  chkfs "./windows/"
  wget -O ./windows/JuicyPotato.exe "https://github.com/ohpe/juicy-potato/releases/latest/download/JuicyPotato.exe"
}

function add_nc() {
  info "Downloading nc for Windows"
  chkfs "./windows/"
  wget -O ./windows/nc.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/nc.exe"
  info "Downloading nc for Linux"
  chkfs "./linux/"
  wget -O ./linux/nc "https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat"
}

function add_spoolsample() {
  info "Downloading SpoolSample"
  chkfs "./windows/"
  wget -O ./windows/SpoolSample.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/SpoolSample.exe"
  wget -O ./windows/SpoolSample_v4.5_x64.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/SpoolSample_v4.5_x64..exe"
}

function add_diaghub() {
  info "Downloading DiagHub"
  chkfs "./windows/"
  wget -O ./windows/diaghub.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/diaghub.exe"
}

function add_lazagne() {
  info "Downloading LaZagne"
  git -C ./ clone -q https://github.com/AlessandroZ/LaZagne
  chkfs "./linux/"
  rm -v -r -f ./linux/LaZagne
  mv -v  ./LaZagne/Linux ./linux/LaZagne
  chkfs "./mac/"
  rm -v -r -f ./mac/LaZagne
  mv -v  ./LaZagne/Mac ./mac/LaZagne
  chkfs "./windows/"
  rm -v -r -f ./windows/LaZagne
  mv -v  ./LaZagne/Windows ./windows/LaZagne
  wget -O ./windows/LaZagne/lazagne.exe "https://github.com/AlessandroZ/LaZagne/releases/latest/download/lazagne.exe"
  rm -v -r -f ./LaZagne
}

function add_sublinacl() {
  info "Downloading Sublinacl"
  chkfs "./windows/"
  wget -O ./windows/sublinacl.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/sublinacl.exe"
}

function add_plink() {
  info "Downloading plink"
  chkfs "./windows/"
  wget -O ./windows/plink32.exe "https://the.earth.li/~sgtatham/putty/latest/w32/plink.exe"
  wget -O ./windows/plink64.exe "https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe"
}

function add_deepce() {
  info "Downloading deepce"
  chkfs "./linux/"
  wget -O ./linux/deepce.sh "https://github.com/stealthcopter/deepce/raw/master/deepce.sh"
}

function add_webshells() {
  info "Downloading webshells"
  chkfs "./webshells/PHP/wso-webshell/"
  wget -O ./webshells/PHP/wso-webshell/wso.php "https://raw.githubusercontent.com/mIcHyAmRaNe/wso-webshell/master/wso.php"
  sed -i 's/fa769dac7a0a94ee47d8ebe021eaba9e/0fc3bcf177377d328c77b2b51b7f3c9b/g' ./webshells/PHP/wso-webshell/wso.php 2>/dev/null || perl -i -pe 's/fa769dac7a0a94ee47d8ebe021eaba9e/0fc3bcf177377d328c77b2b51b7f3c9b/g' ./webshells/PHP/wso-webshell/wso.php
  echo 'exegol4thewin' > ./webshells/PHP/wso-webshell/password.txt
  # Setting password to exegol4thewin
  chkfs "./webshells/ASPX"
  wget -O ./webshells/ASPX/webshell.aspx "https://raw.githubusercontent.com/xl7dev/WebShell/master/Aspx/ASPX%20Shell.aspx"
}

function add_ysoserial_net() {
  info "Downloading ysoserial"
  chkfs "./windows/"
  #  URL=$(curl --location --silent --output /dev/null --write-out %{url_effective} https://github.com/pwntester/ysoserial.net/releases/latest)
  #  VERSION=${URL##*v}
  #  wget -O ./ysoserial_net.zip "https://github.com/pwntester/ysoserial.net/releases/latest/download/ysoserial-$VERSION.zip"
  wget -O ./ysoserial_net.zip "https://github.com/pwntester/ysoserial.net/releases/download/v1.36/ysoserial-1dba9c4416ba6e79b6b262b758fa75e2ee9008e9.zip"
  unzip -d ./windows/ ./ysoserial_net.zip
  rm -v -r -f ./windows/ysoserial.net
  mv -v  ./windows/Release/ ./windows/ysoserial.net
  rm -v ./ysoserial_net.zip
}

function add_http-put-server() {
  info "Downloading http-put-server for Python3"
  chkfs "./linux/"
  wget -O ./linux/http-put-server.py "https://gist.githubusercontent.com/mildred/67d22d7289ae8f16cae7/raw/214c213c9415da18a471d1ed04660022cce059ef/server.py"
}

function add_chisel() {
  info "Downloading Chisel"
  chkfs "./windows/chisel/"
  chkfs "./linux/chisel/"
  URL=$(curl --location --silent --output /dev/null --write-out %{url_effective} https://github.com/jpillora/chisel/releases/latest)
  VERSION=${URL##*v}
  wget -O - "https://github.com/jpillora/chisel/releases/latest/download/chisel_${VERSION}_windows_amd64.gz" | gzip -d > ./windows/chisel/chisel64.exe
  wget -O - "https://github.com/jpillora/chisel/releases/latest/download/chisel_${VERSION}_windows_386.gz" | gzip -d > ./windows/chisel/chisel32.exe
  wget -O - "https://github.com/jpillora/chisel/releases/latest/download/chisel_${VERSION}_linux_amd64.gz" | gzip -d > ./linux/chisel/chisel64
  wget -O - "https://github.com/jpillora/chisel/releases/latest/download/chisel_${VERSION}_linux_386.gz" | gzip -d > ./linux/chisel/chisel32
}

function update_submodules() {
  info "Updating git submodules"
  git submodule update --init --recursive --remote --merge
}

function add_ligolo-ng() {
  info "Downloading ligolo-ng agents"
  chkfs "./windows/ligolo-ng/"
  chkfs "./linux/ligolo-ng/"
  URL=$(curl --location --silent --output /dev/null --write-out %{url_effective} https://github.com/nicocha30/ligolo-ng/releases/latest)
  VERSION=${URL##*v}
  # AMD64 agent
  wget -O- "https://github.com/nicocha30/ligolo-ng/releases/latest/download/ligolo-ng_agent_${VERSION}_linux_amd64.tar.gz"|tar -xzvf - -C ./linux/ligolo-ng
  mv ./linux/ligolo-ng/agent ./linux/ligolo-ng/agent_linux_amd64
  rm -rf ./linux/ligolo-ng/README.md ./linux/ligolo-ng/LICENSE
  # ARM64 agent
  wget -O- "https://github.com/nicocha30/ligolo-ng/releases/latest/download/ligolo-ng_agent_${VERSION}_linux_arm64.tar.gz"|tar -xzvf - -C ./linux/ligolo-ng
  mv ./linux/ligolo-ng/agent ./linux/ligolo-ng/agent_linux_arm64
  rm -rf ./linux/ligolo-ng/README.md ./linux/ligolo-ng/LICENSE
  # Windows agent
  wget -O ./windows/ligolo-ng/agent.zip "https://github.com/nicocha30/ligolo-ng/releases/latest/download/ligolo-ng_agent_${VERSION}_windows_amd64.zip"
  unzip -o -d ./windows/ligolo-ng/agent64.exe ./windows/ligolo-ng/agent.zip
  mv ./windows/ligolo-ng/agent64.exe/agent.exe ./windows/ligolo-ng/agent.exe
  rm -rf ./windows/ligolo-ng/agent64.exe/ ./windows/ligolo-ng/agent.zip
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
  add_ligolo-ng
  update_submodules
}

add_resources
success "Done updating Exegol-resources"
