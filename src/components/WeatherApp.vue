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
      <p class="weather-feels-like">Feels Like: {{ weather.main.feels_like }} &deg;C
      </p>
      <p class="weather-humidity">Humidity: {{ weather.main.humidity }}%
      </p>
      <p class="weather-visibility">Visibility: {{ weather.visibility }} meters
      </p>
      <p class="weather-wind-speed">Wind Speed: {{ weather.wind.speed }} m/s
      </p>
    </div>

    <div class="weather-forecast" v-if="forecast">
      <h3 class="forecast-title">5-Day Forecast</h3>
      <div class="forecast-days">
        <div class="forecast-day" v-for="day in forecast.list" :key="day.dt">
          <p class="forecast-date">{{ formatDate(day.dt) }}
          </p>
          <img :src="getWeatherIconUrl(day.weather[0].icon)" :alt="day.weather[0].description" class="forecast-pic"/>
          <p class="forecast-description">{{ day.weather[0].description }}
          </p>
          <p class="forecast-temp">Temperature: {{ day.main.temp }} &deg;
          </p>
          <p class="forecast-humidity">Humidity: {{ day.main.humidity }}%
          </p>
          <p class="forecast-wind-speed">Wind Speed: {{ day.wind.speed }} m/s
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      city: '',
      weather: null,
      forecast: null
    }
  },
  methods: {
    async fetchWeather() {
      const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?q=${this.city}&appid=dfb15a2f6fe844745dbcd16631920fd5&units=metric`);
      this.weather = await response.json();

      const forecastResponse = await fetch(`https://api.openweathermap.org/data/2.5/forecast?q=${this.city}&appid=dfb15a2f6fe844745dbcd16631920fd5&units=metric`);
      this.forecast = await forecastResponse.json();
    },
    getWeatherIconUrl(iconCode) {
      return `http://openweathermap.org/img/wn/${iconCode}.png`;
    },
    formatDate(timestamp) {
      const date = new Date(timestamp * 1000);
      const options = { weekday: 'short', month: 'short', day: 'numeric' };
      return date.toLocaleDateString('en-US', options);
    }
  }
}
</script>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200&display=swap');
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
    font-family: Montserrat;
  }
  
  .search-form input {
    flex: 1;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    font-family: Montserrat;
  }
  
  .search-form button {
    padding: 10px 20px;
    background-color: blueviolet;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    font-family: Montserrat;
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
    font-family: Montserrat;
    color: darkblue;
  }
  
  .weather-description {
    font-size: 24px;
    margin-bottom: 20px;
    font-family: Montserrat;
  }
  
  .weather-temp,
  .weather-feels-like,
  .weather-humidity,
  .weather-visibility,
  .weather-wind-speed,
  .forecast-wind-speed,
  .forecast-humidity,
  .forecast-temp
  {
    font-size: 20px;
    margin-bottom: 10px;
    font-family: Montserrat;
  }
  
  .weather-pic
  {
    margin-bottom: 1px;
    background-color: black;
    width: 840;
    height: 1040;
  }
  
  .weather-forecast {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    flex-wrap: wrap;
    font-family: Montserrat;
  }
  
  .forecast-days {
    flex: 0 0 calc(33.33% - 20px);
    background-color: #f5f5f5;
    border-radius: 5px;
    padding: 20px;
    margin-bottom: 20px;
    font-family: Montserrat;
  }
  
  .forecast-day {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    color: darkblue;
    font-family: Montserrat;
  }
  
  .forecast-temp {
    font-size: 16px;
    margin-bottom: 5px;
    color: blue;
    font-family: Montserrat;
  }
  
  .forecast-description {
    font-size: 14px;
    color: gray;
    margin-bottom: 10px;
    font-family: Montserrat;
  }
  
  .forecast-pic {
    width: 80px;
    height: 80px;
    margin-bottom: 4px;
    background-color: black;
  }
</style>
