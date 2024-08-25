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

function add-to-list() {
  echo "$1" >> "resources_list.csv"
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
  add-to-list "SysInternals,https://learn.microsoft.com/en-us/sysinternals,Windows utilities signed by Microsoft"
}

function add_pspy() {
  info "Downloading pspy"
  chkfs "./linux/pspy/"
  wget -O ./linux/pspy/pspy32 "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy32"
  wget -O ./linux/pspy/pspy64 "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64"
  wget -O ./linux/pspy/pspy32s "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy32s"
  wget -O ./linux/pspy/pspy64s "https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64s"
  add-to-list "pspy,https://github.com/DominicBreuker/pspy,Monitor linux processes without root permissions"
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
  wget -O ./windows/winPEAS/winPEAS.ps1 "https://raw.githubusercontent.com/peass-ng/PEASS-ng/master/winPEAS/winPEASps1/winPEAS.ps1"
  add-to-list "PEASS-ng,https://github.com/carlospolop/PEASS-ng,Privilege Escalation Awesome Scripts SUITE"
}

function add_linux_smart_enumeration() {
  info "Downloading Linux Smart Enumeration"
  chkfs "./linux/"
  wget -O ./linux/linux-smart-enumeration.sh "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh"
  add-to-list "linux-smart-enumeration (lse.sh),https://github.com/diego-treitos/linux-smart-enumeration,Linux enumeration tool for pentesting and CTFs with verbosity levels"
}

function add_linenum() {
  info "Downloading LinEnum"
  chkfs "./linux/"
  wget -O ./linux/LinEnum.sh "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
  add-to-list "LinEnum,https://github.com/rebootuser/LinEnum,Scripted Local Linux Enumeration & Privilege Escalation Checks"
}

function add_linux_exploit_suggester() {
  info "Downloading Linux Exploit Suggester"
  chkfs "./linux/"
  wget -O ./linux/linux-exploit-suggester.sh "https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh"
  add-to-list "Linux Exploit Suggester,https://github.com/The-Z-Labs/linux-exploit-suggester,Linux privilege escalation auditing tool"
}

function add_mimikatz() {
  info "Downloading mimikatz"
  chkfs "./windows/"
  wget -O ./windows/mimikatz_trunk.zip "https://github.com/gentilkiwi/mimikatz/releases/latest/download/mimikatz_trunk.zip"
  unzip -o -d ./windows/mimikatz/ ./windows/mimikatz_trunk.zip
  rm -v ./windows/mimikatz_trunk.zip
  add-to-list "Mimikatz,https://github.com/gentilkiwi/mimikatz,A little tool to play with Windows security"
}

function add_sharphound() {
  info "Downloading SharpHound"
  chkfs "./windows/"
  wget -O ./windows/SharpHound.exe "https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.exe"
  add-to-list "SharpHound.exe,https://github.com/BloodHoundAD/BloodHound,C# ingestor for BloodHound"
}

function add_juicypotato() {
  info "Downloading JuicyPotato"
  chkfs "./windows/"
  wget -O ./windows/JuicyPotato.exe "https://github.com/ohpe/juicy-potato/releases/latest/download/JuicyPotato.exe"
  add-to-list "JuicyPotato.exe,https://github.com/ohpe/juicy-potato,https://github.com/ohpe/juicy-potato"
}

function add_printspoofer() {
  info "Downloading PrintSpoofer"
  chkfs "./windows/"
  wget -O ./windows/PrintSpoofer32.exe "https://github.com/itm4n/PrintSpoofer/releases/latest/download/PrintSpoofer32.exe"
  wget -O ./windows/PrintSpoofer64.exe "https://github.com/itm4n/PrintSpoofer/releases/latest/download/PrintSpoofer64.exe"
  add-to-list "PrintSpoofer,https://github.com/itm4n/PrintSpoofer,Abusing SeImpersonatePrivilege from LOCAL/NETWORK SERVICE"
}

function add_godpotato() {
  info "Downloading GodPotato"
  chkfs "./windows/"
  wget -O ./windows/GodPotato-NET2.exe "https://github.com/BeichenDream/GodPotato/releases/latest/download/GodPotato-NET2.exe"
  wget -O ./windows/GodPotato-NET35.exe "https://github.com/BeichenDream/GodPotato/releases/latest/download/GodPotato-NET35.exe"
  wget -O ./windows/GodPotato-NET4.exe "https://github.com/BeichenDream/GodPotato/releases/latest/download/GodPotato-NET4.exe"
  add-to-list "GodPotato,https://github.com/BeichenDream/GodPotato,Abusing SeImpersonatePrivilege on recent Windows OS (up to W11 and Server 2022)"
}

function add_nc() {
  info "Downloading nc for Windows"
  chkfs "./windows/"
  wget -O ./windows/nc.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/nc.exe"
  info "Downloading nc for Linux"
  chkfs "./linux/"
  wget -O ./linux/nc "https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat"
  add-to-list "static netcat (linux),https://github.com/andrew-d/static-binaries,Utility to establish TCP or UDP connections"
  add-to-list "static netcat (windows),https://gitlab.com/onemask/pentest-tools,Utility to establish TCP or UDP connections"
}

function add_spoolsample() {
  info "Downloading SpoolSample"
  chkfs "./windows/"
  wget -O ./windows/SpoolSample.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/SpoolSample.exe"
  wget -O ./windows/SpoolSample_v4.5_x64.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/SpoolSample_v4.5_x64..exe"
  add-to-list "SpoolSample.exe,https://gitlab.com/onemask/pentest-tools,PoC tool to coerce Windows hosts authenticate to other machines"
}

function add_diaghub() {
  info "Downloading DiagHub"
  chkfs "./windows/"
  wget -O ./windows/diaghub.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/diaghub.exe"
  add-to-list "DiagHub.exe,https://gitlab.com/onemask/pentest-tools,Diagnostics Hub Standard Collector Service"
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
  add-to-list "LaZagne,https://github.com/AlessandroZ/LaZagne,Credentials recovery project"
}

function add_sublinacl() {
  info "Downloading Sublinacl"
  chkfs "./windows/"
  wget -O ./windows/sublinacl.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/sublinacl.exe"
  add-to-list "Sublinacl.exe,https://gitlab.com/onemask/pentest-tools,Modify Access Control Entries"
}

function add_plink() {
  info "Downloading plink"
  chkfs "./windows/"
  wget -O ./windows/plink32.exe "https://the.earth.li/~sgtatham/putty/latest/w32/plink.exe"
  wget -O ./windows/plink64.exe "https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe"
  add-to-list "plink.exe,https://www.cog-genomics.org/plink/,Network connection tool"
}

function add_deepce() {
  info "Downloading deepce"
  chkfs "./linux/"
  wget -O ./linux/deepce.sh "https://github.com/stealthcopter/deepce/raw/master/deepce.sh"
  add-to-list "deepce,https://github.com/stealthcopter/deepce,Docker Enumeration Escalation of Privileges and Container Escapes"
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
  add-to-list "Some webshells,,PHP and ASPX webshells"
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
  add-to-list "ysoserial,https://github.com/pwntester/ysoserial,A proof-of-concept tool for generating payloads that exploit unsafe Java object deserialization"
}

function add_http-put-server() {
  info "Downloading http-put-server for Python3"
  chkfs "./linux/"
  wget -O ./linux/http-put-server.py "https://gist.githubusercontent.com/mildred/67d22d7289ae8f16cae7/raw/214c213c9415da18a471d1ed04660022cce059ef/server.py"
  add-to-list "http-put-server,https://gist.githubusercontent.com/mildred/67d22d7289ae8f16cae7/raw/214c213c9415da18a471d1ed04660022cce059ef/server.py,HTTP PUT Server"
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
  add-to-list "Chisel,https://github.com/jpillora/chisel,A fast TCP/UDP tunnel over HTTP"
}

function add_winpwn() {
  info "Downloading WinPwn"
  chkfs "./windows/WinPwn/"
  URL=$(curl --location --silent --output /dev/null --write-out %{url_effective} https://github.com/S3cur3Th1sSh1t/WinPwn/releases/latest)
  VERSION=${URL##*/}
  wget -O ./windows/WinPwn/WinPwn.exe "https://github.com/S3cur3Th1sSh1t/WinPwn/releases/latest/download/${VERSION}/WinPwn.exe"
  wget -O ./windows/WinPwn/WinPwn.ps1 "https://github.com/S3cur3Th1sSh1t/WinPwn/releases/latest/download/${VERSION}/WinPwn.ps1"
  add-to-list "WinPwn,https://github.com/S3cur3Th1sSh1t/WinPwn,Automation for AD pentesting"
}

function update_submodules() {
  info "Updating git submodules"
  git submodule update --init --recursive --remote --merge
  add-to-list "bitleaker,https://github.com/kkamagui/bitleaker,This tool can decrypt a BitLocker-locked partition with the TPM vulnerability"
  add-to-list "napper,https://github.com/kkamagui/napper-for-tpm,TPM vulnerability checking tool for CVE-2018-6622"
  add-to-list "mimipenguin,https://github.com/huntergregal/mimipenguin,A tool to dump the login password from the current linux user"
  add-to-list "p0wny-shell,https://github.com/flozz/p0wny-shell,Single-file PHP shell"
  add-to-list "Inveigh,https://github.com/Kevin-Robertson/Inveigh,.NET IPv4/IPv6 machine-in-the-middle tool for penetration testers"
  add-to-list "MailSniper,https://github.com/dafthack/MailSniper,Penetration testing tool for searching through email in a Microsoft Exchange"
  add-to-list "PowerSploit,https://github.com/PowerShellMafia/PowerSploit,A PowerShell Post-Exploitation Framework"
  add-to-list "PrivescCheck,https://github.com/itm4n/PrivescCheck,Privilege Escalation Enumeration Script for Windows"
  add-to-list "SharpCollection,https://github.com/Flangvik/SharpCollection,Nightly builds of common C# offensive tools"
  add-to-list "WinEnum,https://github.com/neox41/WinEnum,Script for Local Windows Enumeration"
  add-to-list "impacket-examples-windows,https://github.com/maaaaz/impacket-examples-windows,The great impacket example scripts compiled for Windows"
  add-to-list "nishang,https://github.com/samratashok/nishang,Offensive PowerShell for red team"
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
  add-to-list "ligolo-ng,https://github.com/nicocha30/ligolo-ng,Advanced yet simple tunneling/pivoting tool that uses a TUN interface"
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
  add_printspoofer
  add_godpotato
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
  add_winpwn
  add_ligolo-ng
  update_submodules
}

rm resources_list.csv
add-to-list "Resource,Link,Description"
add_resources
success "Done updating Exegol-resources"
