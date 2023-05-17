#!/bin/bash

# https://gist.github.com/nfekete/7a277bf9e25e89e1c8bfb8b64dcc08ed

# https://gist.github.com/MatMercer/f7e25b9c8ce7ca40dd3b220346136d23

# wsl cisco sny issue solved
# https://gist.github.com/pyther/b7c03579a5ea55fe431561b502ec1ba8


TMP=`mktemp`
trap ctrlC INT

removeTempFiles() {
	rm -f $TMP
}

ctrlC() {
	echo
	echo "Trapped Ctrl-C, removing temporary files"
	removeTempFiles
	stty sane
}

echo "Current resolv.conf"
echo "-------------------"
cat /etc/resolv.conf

echo
echo "Creating new resolv.conf"
echo "------------------------"

{
	head -1 /etc/resolv.conf | grep '^#.*generated'
	for i in `/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "Get-DnsClientServerAddress -AddressFamily ipv4 | Select-Object -ExpandProperty ServerAddresses"`; do
		if  [[ $i != 192* ]] ;
		then
			echo nameserver $i
		fi
	done
	tail -n+2 /etc/resolv.conf | grep -v '^nameserver'
} | tr -d '\r' | tee $TMP

(set -x; sudo cp -i $TMP /etc/resolv.conf)

removeTempFiles
