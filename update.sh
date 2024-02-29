#!/usr/bin/env bash
#
# [Release]: SnoopGod 22.04.4 LTS amd64
# [Website]: https://snoopgod.com/releases/?ver=22.04.4
# [License]: http://www.gnu.org/licenses/gpl-3.0.html

## -------------- ##
## DEFINE ACTIONS ##
## -------------- ##

## Keep alive
## ----------
function keepalive()
{
	sudo -v
	while true;
	do
		sudo -n true;
		sleep 60s;
		kill -0 "$$" || exit;
	done 2>/dev/null &
}

## Prompt User
## -----------
function promptuser()
{
	read -p "[?] Enter your username? " username
	if ! id -u "$username" >/dev/null 2>&1; then
	  	echo -e "[!] This username do not exists"
	  	promptuser
	fi
}

## Update System
## -------------
function updatehook()
{
	echo -e "[+] Update system"
}

## -------------- ##
## EXECUTE SCRIPT ##
## -------------- ##

## Launch
## ------
function launch()
{
	# Execute Actions
	keepalive
	promptuser
	updatehook
}

## -------- ##
## CALLBACK ##
## -------- ##

launch
