var path = require('path')

const resolve = name => path.resolve(__dirname, '../dist/' + name + '.html')

var packageConfig = [{
  filename: process.env.NODE_ENV === 'testing'
    ? 'index.html'
    : resolve('index'),
  template: 'template/main.ejs',
  chunks: ['manifest', 'vendor', 'main'],
  title: 'PandaUI',
  keywords: 'PandaUI',
  description: 'PandaUI'
}]

module.exports = packageConfig
