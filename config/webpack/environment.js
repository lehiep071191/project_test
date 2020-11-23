
const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery',
  jquery: 'jquery',
  'window.jQuery': 'jquery',
  Popper: ['popper.js', 'default']
}))


module.exports = environment

const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.loaders.append('gmap4rails', {
  test: /gmaps_google/,
  use: [
    {
      loader: 'imports-loader',
      options: 'this=>window',
    },
  ],
})

environment.plugins.append(
  'lodash',
  new webpack.ProvidePlugin({
    _: 'lodash',
  })
)

module.exports = environment
