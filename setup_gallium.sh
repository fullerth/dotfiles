set -e

echo "Removing Extra Home Directories"
extra_dirs="Documents Pictures Templates Videos Music Public"

echo "Moving to home directory"
cd ~
for dir in $extra_dirs; do
    echo "Attempting to find if directory exists"
    if [[ -d "${dir}" ]] ; then
        echo "Directory Exists"
        if [[ -L "${dir}" ]] ; then
        else
            echo "Removing ${dir}"
            rmdir "${dir}"
        fi 
    fi
done

echo "Installing crosstool-ng prerequisites"
sudo apt-get install gcc gperf bison flex texinfo help2man gawk libtool-bin automake libncurses5-dev g++

echo "Installing general tools"
sudo apt-get install cmake exuberant-ctags git nmap
