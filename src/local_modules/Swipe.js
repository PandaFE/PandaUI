import extend from 'lodash/extend'

class Swipe {
  constructor (options) {
    this._default(options)
  }

  _default (options = {}) {
    if (!options.target) {
      console.error('options "target" is required as a DOM Node')
      return
    }
    this.options = extend({
      move: function () {},
      transitionDuration: '150ms',
      transitionTimingFn: 'ease-out'
    }, options)
  }

  init () {}
}

export default Swipe
