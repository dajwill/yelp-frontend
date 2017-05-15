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
  // let { filter, query } = req.query
  let filter = req.query.filter || ''
  let query = req.query.query || ''
  let url = `https://api.yelp.com/v3/businesses/search`
  let headers = {
    Authorization: yelp_auth
  }
  let params = {
    location: 48103,
    term: query,
    categories: filter
  }

  axios.get(url, {params: params, headers: headers})
    .then((data) => {
      var businesses = data.data.businesses
      return res.send(businesses)
    })
    .catch((err) => res.send(new Error(err)))
})

app.listen(8081, function () {
  console.log('CORS-enabled web server listening on port 8081')
})
