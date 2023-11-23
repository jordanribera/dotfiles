TEMP=~/.setup_temp
mkdir $TEMP

# install gnome components
apt install -y \
    gnome-tweaks \
    gnome-shell-extension-dash-to-panel \
    gnome-shell-extension-no-annoyance \
    gnome-shell-extension-system-monitor \


# install android platform tools
apt install -y android-sdk-platform-tools
# OR https://dl.google.com/android/repository/platform-tools-latest-linux.zip

#install chrome
wget -O $TEMP/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y $TEMP/chrome.deb

# install unified remote
wget -O $TEMP/unified-remote.deb https://www.unifiedremote.com/download/linux-x64-deb
apt install -y $TEMP/unified-remote.deb

# install misc. applications
apt install -y \
    celluloid \
    git \
    htop \
    net-tools \
    qbittorrent \
    telegram-desktop \
    vim \
    vlc \


# run virtualization setup
/bin/bash ./virtualization_setup.sh
