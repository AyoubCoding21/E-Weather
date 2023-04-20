<template>
	<div class="weather-app">
	    <form class="search-form" @submit.prevent="fetchWeather">
	      <label for="city-input">Enter a city name:</label>
	      <input id="city-input" type="text" v-model="city" placeholder="E.g. London">
	      <button type="submit">Fetch Weather</button>
	    </form>

	    <div class="weather-info" v-if="weather">
	      <h2 class="city-name">{{ city }}</h2>
	      <img class="weather-pic" :src="getWeatherIconUrl(weather.weather[0].icon)" :alt="weather.weather[0].description" />
	      <p class="weather-description">{{ weather.weather[0].description }}</p>
	      <p class="weather-temp">Temperature: {{ weather.main.temp }} &deg;C</p>
	      <p class="weather-feels-like">Feels Like: {{ weather.main.feels_like }} &deg;C</p>
	      <p class="weather-humidity">Humidity: {{ weather.main.humidity }}%</p>
	      <p class="weather-visibility">Visibility: {{ weather.visibility }} meters</p>
	      <p class="weather-wind-speed">Wind Speed: {{ weather.wind.speed }} m/s</p>
	    </div>
	</div>
</template>

<script>
  export default {
    data() {
      return {
        city: '',
        weather: null
      }
    },
    methods: {
      async fetchWeather() {
        const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?q=${this.city}&appid=dfb15a2f6fe844745dbcd16631920fd5&units=metric`);
        this.weather = await response.json();
      },
      getWeatherIconUrl(iconCode) {
        return `http://openweathermap.org/img/wn/${iconCode}.png`;
      }
    }
  }
</script>

<style>
  .weather-app {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
  }
  
  .search-form {
    display: flex;
    flex-direction: row;
    margin-bottom: 20px;
  }
  
  .search-form label {
    font-family: monospace;
    font-weight: bold;
    margin-right: 10px;
    color: orangered;
  }
  
  .search-form input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    font-family: monospace;
  }
  
  .search-form button {
    padding: 10px 20px;
    background-color: blueviolet;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    font-family: sans-serif;
  }
  
  .search-form button:hover {
    background-color: orangered;
  }
  
  .weather-info {
    text-align: center;
  }
  
  .city-name {
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 10px;
    font-family: monospace;
    color: darkblue;
  }
  
  .weather-description {
    font-size: 24px;
    margin-bottom: 20px;
    font-family: sans-serif;
  }
  
  .weather-temp,
  .weather-feels-like,
  .weather-humidity,
  .weather-visibility,
  .weather-wind-speed
  {
    font-size: 20px;
    margin-bottom: 10px;
    font-family: sans-serif;
  }
  .weather-pic
  {
	margin-bottom: 1px;
	background-color: black;
	width: 840;
	height: 1040;
  }
</style>


