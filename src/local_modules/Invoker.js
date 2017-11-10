class Invoker {
  constructor (type) {
    this.type = type
    this.callback = null
  }

  execute (data) {
    let context = window.inject || {}
    let fn = context[this.type] || (() => false)
    return fn.apply(context, [].slice.call(arguments))
  }

  registerCallback (cb) {
    if (this.callback) {
      this.removeCallback()
    }
    this.callback = ({ detail }) => {
      if (detail.type === this.type) {
        cb && cb(detail.result === 'ok' ? detail : false)
      }
    }
    window.addEventListener('callback.' + this.type, this.callback)
  }

  removeCallback () {
    window.removeEventListener('callback.' + this.type, this.callback)
    this.callback = null
  }
}

export default Invoker
