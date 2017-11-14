var path = require('path')
var utils = require('./utils')
var config = require('./config')

function resolve (dir) {
  return path.join(__dirname, '../', dir)
}

module.exports = {
  entry: {
    main: './entries/main.js'
  },
  output: {
    path: config.build.assetsRoot,
    filename: '[name].js',
    publicPath: process.env.NODE_ENV === 'production'
      ? config.build.assetsPublicPath
      : config.dev.assetsPublicPath
  },
  resolve: {
    extensions: ['.js', '.tag', '.json'],
    alias: {
      '@': resolve('src'),
      'theme': resolve('src/theme')
    }
  },
  module: {
    rules: [
      {
        test: /\.(js|tag)$/,
        loader: 'eslint-loader',
        enforce: 'pre',
        include: [resolve('src')],
        options: {
          formatter: require('eslint-friendly-formatter')
        }
      },
      {
        test: /\.tag$/,
        loader: 'riot-tag-loader',
        options: {
          hot: true
        }
      },
      {
        test: /\.js|tag/,
        enforce: 'post',
        loader: 'babel-loader',
        include: [resolve('src')]
      },
      {
        test: /\.json$/,
        loader: 'json-loader'
      },
      {
        test: /\.(png|jpe?g|gif|svg)(\?.*)?$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: utils.assetsPath('img/[name].[hash:7].[ext]')
        }
      },
      {
        test: /\.(woff2?|eot|ttf|otf)(\?.*)?$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: utils.assetsPath('fonts/[name].[hash:7].[ext]')
        }
      }
    ]
  }
}
