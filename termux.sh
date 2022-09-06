PANDA="\nPanda Userbot Deploy Sementara di Termux"
PANDA+="\n "
PANDA+="\nMari kita mulai"
PANDA+="\nSebelumnya Join channel "
PANDA+="\n "
PANDA+="\n📢 Channel: @PandaUserbot"
PANDA+="\n⚙Dev: Ilham mansiz"
PANDA+="\n "
DEV="\n "
echo -e $PANDA
echo -e $DEV
echo "Sedang Menginstal...."
echo -e $DEV
pkg update -y && pkg upgrade
clear
echo -e $PANDA
echo -e $DEV
echo "Menginstal python"
echo -e $DEV
pkg install python3
echo "Menginstal python"
pkg install python3-pip
pip3 install --upgrade pip
echo "Menginstal wget"
pkg install wget
apt install tree wget2 p7zip-full jq ffmpeg wget git -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
cle
echo -e $PANDA
echo -e $DEV
clear
echo -e $PANDA
echo -e $DEV
echo "PandaUserbot"
pkg install git -y
rm -rf DEPLOY
echo -e $DEV
git clone https://github.com/ilhammansiz/DEPLOY
clear
echo -e $PANDA
echo -e $DEV
echo "Mulai install"
echo -e $DEV
cd DEPLOY 
bash Text.sh
nano env
