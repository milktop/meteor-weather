Template.weather.rendered = ->
  Session.set 'userLocation', ''
  Session.set 'weather', ''
  Session.set 'weatherSummary', ''
  Session.set 'weatherTime', ''

Template.weather.helpers 
  
  location: ->
    return Session.get 'userLocation'

  weather: ->
    return Session.get 'weather'

  weatherSummary: ->
    return Session.get 'weatherSummary'

  weatherTime: ->
    return Session.get 'weatherTime'

Template.weather.events
  'submit form': (event) ->
    event.preventDefault()
    Session.set 'userLocation', $(event.target).find('.search-location').val()
    Meteor.call 'getWeather', Session.get('userLocation'), (err, results) ->
      contentParsed = JSON.parse(results.content)
      Session.set 'weather', contentParsed
      Session.set 'weatherSummary', contentParsed.weather[0].description
      Session.set 'weatherTime', moment.unix(contentParsed.dt).format("DD/MM/YYYY hh:mm")