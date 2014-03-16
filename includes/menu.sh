#!/bin/bash

########## Start Menu #########
source includes/variables.sh
source includes/functions.sh

# Installer Menu
function installer_menu(){
	echo "========================================="
	echo -e "${LIGHT_BLUE}${BOLD}Welcome to RADIUSdesk Installer${F_END} ${LIGHT_RED}${BOLD}v${RD_INSTALLER_VERSION}${F_END}"
	echo "========================================="
	echo -e "1) Setup RADIUSdesk"
	echo -e "2) Setup CoovaChilli Captive Portal (Optional)"
	echo -e "3) Quit or q"
	echo -n "Select an option: "
	RD_DISTRO=os_distro_type
	read menu_opt
	case "${menu_opt}" in
		1) 
		if [[ "${RD_DISTRO}" = "red" ]] || [[ "${RD_DISTRO}" = "centos" ]]; then
			source includes/rhel_centos_core.sh
		elif [[ "${RD_DISTRO}" = "ubuntu" ]]; then
			source includes/ubuntu_core.sh
		fi
		;;
		2) 
		if [[ "${RD_DISTRO}" = "red" ]] || [[ "${RD_DISTRO}" = "centos" ]]; then
			source includes/coovachilli_core.sh
		elif [[ "${RD_DISTRO}" = "ubuntu" ]]; then
			source includes/coovachilli_ubuntu_core.sh
		fi
		;;
		3|q) 
		echo -e "${LIGHT_RED}${BOLD}Exiting Installer...:(${F_END}"
		exit 1;;
		*) 
		echo -e "${LIGHT_RED}${BOLD}Invalid selection!${F_END}"
		exit 1;;
	
	esac
}

# Show RADIUSdesk Installer Version
function show_version(){
	while getopts ":v-:" opt; do
	  case $opt in
		v)
		  echo -e "RADIUSdesk Installer ${LIGHT_BLUE}${BOLD}${RD_INSTALLER_VERSION}${F_END}" >&2
		  exit 0;;
		-)
			case $OPTARG in
			 version) echo -e "RADIUSdesk Installer ${LIGHT_BLUE}${BOLD}${RD_INSTALLER_VERSION}${F_END}" >&2
			 exit 0;;
			 *) 
			 echo -e "Usage: ${LIGHT_BLUE}${BOLD}./$(basename $0) -v | --version${F_END}" >&2
			 exit 1;;
			esac;;
		\?)
		  echo -e "Usage: ${LIGHT_BLUE}${BOLD}./$(basename $0) -v | --version${F_END}" >&2
		  exit 1
		  ;;
	  esac
	done
}

########## End Menu #########