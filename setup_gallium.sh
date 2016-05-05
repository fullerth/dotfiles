set -e

echo "Removing Extra Home Directories"
extra_dirs="Documents Pictures Templates Videos"

for dir in $extra_dirs; do
    if [[ -d "~/${dir}" && ! -L "~/${dir}" ]] ; then
        rmdir "~/${dir}"
    fi
done

echo "Installing crosstool-ng prerequisites"
sudo apt-get install gcc gperf bison flex texinfo help2man gawk libtool-bin automake libncurses5-dev g++

echo "Installing general tools"
sudo apt-get install cmake exuberant-ctags git nmap
