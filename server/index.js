var express = require('express')
var cors = require('cors')
const axios = require('axios');
const yelp_auth = require('../keys.json').yelp;
var app = express()

app.use(cors())

app.get('/', (req, res) => {
  return res.send('Hello')
})

app.get('/search', (req, res) => {
  let { filter, query } = req.query
  axios.get(`https://api.yelp.com/v3/businesses/search?location=48103&term=${query}&category=${filter}`,
    {
      headers: {
        Authorization: yelp_auth
      }
    }
  )
    .then((data) => {
      var businesses = data.data.businesses
      return res.send(businesses)
    })
    .catch((err) => res.send(new Error(err)))
})

app.listen(8081, function () {
  console.log('CORS-enabled web server listening on port 8081')
})
