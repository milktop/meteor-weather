Meteor.methods 'getWeather': (city) ->
    Meteor.http.get 'http://api.openweathermap.org/data/2.5/weather?q=' + city + '&units=metric'