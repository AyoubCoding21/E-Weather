echo -e "\e[1;33m${bold}Installing and building...\e[0m";
sudo apt install npm -y --no-install-recommends;
npm install && npm audit fix --force
npm run electron:build
./dist_electron/e-weather-1.0.0.AppImage
