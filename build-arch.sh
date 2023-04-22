sudo pacman -Sy && sudo pacman -S npm
sudo npm install
sudo npm audit fix --force
npm run electron:build
./dist_electron/e-weather-1.0.0.AppImage
