import extend from 'lodash/extend'

class Swipe {
  constructor (options) {
    this._default(options)
  }

  _default (options = {}) {
    this.options = extend({
    }, options)
  }

  init () {}
}

export default Swipe
