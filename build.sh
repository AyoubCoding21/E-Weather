echo -e "\e[0;33m${bold}Installing and building...\e[0m";
sudo apt install npm -y --no-install-recommends;
sleep 1s;
if [ -d build/ ]
then
    sleep 1s;
else
    mkdir build;
fi 
npm install && npm audit fix --force
npm run electron:build
cp dist_electron/e-weather-1.0.0.AppImage build/
rm dist_electron -rf
./build/e-weather-1.0.0.AppImage
