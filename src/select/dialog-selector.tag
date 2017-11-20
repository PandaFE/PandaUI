<dialog-selector>
  <p-dialog ref="dialog" component={component} config={opts} />

  <script>
    import '@/dialog'
    import './default-dialog-selector'
    import './default-custom-dialog-selector'

    this.extend(this.opts, this.opts.config)

    const {
      options,
      selectorComponent
    } = this.opts

    this.inited = false
    this.dialog = null
    this.component = options && !(options[0] instanceof Array)
      ? 'default-dialog-selector'
      : (selectorComponent || 'default-custom-dialog-selector')

    this.on('mount', () => {
      this.dialog = this.refs.dialog
      this.inited = true
    })

    this.on('update', () => {
      if (this.inited && this.dialog) {
        if (this.opts.active) {
          this.dialog.show()
        } else {
          this.dialog.hide()
        }
      }
    })
  </script>
</dialog-selector>
