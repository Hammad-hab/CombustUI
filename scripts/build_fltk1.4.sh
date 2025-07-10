# This script is for linux systems only!

set -e

echo "Detecting your OS and installing required packages..."

if [ -f /etc/debian_version ]; then
    echo "Debian/Ubuntu detected."
    sudo apt-get update
    sudo apt-get install -y wget build-essential cmake libx11-dev libxft-dev libxinerama-dev libgl1-mesa-dev libglu1-mesa-dev libjpeg-dev

elif [ -f /etc/redhat-release ]; then
    if command -v dnf >/dev/null 2>&1; then
        echo "Fedora/RHEL (dnf) detected."
        sudo dnf install -y wget gcc gcc-c++ make cmake libX11-devel libXft-devel libXinerama-devel mesa-libGL-devel mesa-libGLU-devel libjpeg-turbo-devel
    else
        echo "RHEL/CentOS (yum) detected."
        sudo yum install -y wget gcc gcc-c++ make cmake libX11-devel libXft-devel libXinerama-devel mesa-libGL-devel mesa-libGLU-devel libjpeg-turbo-devel
    fi

elif [ -f /etc/arch-release ]; then
    echo "Arch Linux detected."
    sudo pacman -Sy --needed wget base-devel cmake libx11 libxft libxinerama mesa glu libjpeg-turbo

else
    echo "Unsupported or unknown distribution."
    exit 1
fi

wget https://github.com/fltk/fltk/releases/download/release-1.4.3/fltk-1.4.3-source.tar.gz

tar -xvzf fltk-1.4.3-source.tar.gz

cd fltk-1.4.3
./configure -fPIC
make
sudo make install

echo "Successfully installed FLTK1.4"