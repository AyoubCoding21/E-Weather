# E-Weather
E-Weather is a simple VueJS 2 + Electron based weather app that uses the OpenWeatherMap API.

For CSS the UI is really cool using animations and Montserrat font

There are 2 ways that you can run this project : 

1- To run the dev script by running the following commands :

```sh
sudo apt install -y --no-install-recommends npm git
git clone https://github.com/AyoubCoding21/E-Weather/
cd E-Weather/
npm install && npm audit fix --force && npm audit fix --force && npm audit fix --force
npm run electron:serve
```

2- Or you can compile the whole project and transform it into an executable application :

```sh
sudo apt install -y --no-install-recommends git
git clone https://github.com/AyoubCoding21/E-Weather/
cd E-Weather/
chmod u+x ./build.sh && ./build.sh
```
