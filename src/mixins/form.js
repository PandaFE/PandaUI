import riot from 'riot'

riot.mixin('form-element', {
  init (opts) {
    this.extendOpts()

    this.on('update', () => {
      this.extendOpts()
    })

    this.on('mount', () => {
      this.applyChange && this.applyChange()
    })
  },
  extendOpts () {
    this.extend(this.opts, this.opts.config)
  },
  findDefault () {
    const { options, valueField = 'value', default: dft } = this.opts
    return this.findIndex(options, item => {
      return (item[valueField] || item) === dft
    })
  }
})
