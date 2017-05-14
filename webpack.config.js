var path = require('path')
var webpack = require('webpack')

var config = {
  context: path.resolve(__dirname, './src'),

  entry: {
    app: './app.js',
  },

  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, './dist/assets'),
    publicPath: '/assets',                          // New
  },

  devServer: {
    contentBase: path.resolve(__dirname),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
      "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization"
    }
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: [{
          loader: 'babel-loader',
          options: { presets: ['es2015'] }
        }]
      },
      {
        test: /\.tag$/,
        exclude: /node_modules/,
        use: [{
          loader: 'tag-loader'
        }]
      },
      {
        exclude: /node_modules/,
        test: /\.sass/,
        loaders: ["style", "css?modules&importLoaders=2", "sass", "bulma"]
      }
    ]
  },

  devtool: 'eval-source-map'
}

module.exports = config;
