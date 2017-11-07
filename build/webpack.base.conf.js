var path = require('path')

function resolve (dir) {
  return path.join(__dirname, '../', dir)
}

module.exports = {
  entry: {
    main: './entries/main.js'
  },
  output: {
    path: resolve('dist'),
    filename: '[name].js',
    publicPath: '/'
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
          name: 'img/[name].[hash:7].[ext]'
        }
      },
      {
        test: /\.(woff2?|eot|ttf|otf)(\?.*)?$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: 'fonts/[name].[hash:7].[ext]'
        }
      }
    ]
  }
}
