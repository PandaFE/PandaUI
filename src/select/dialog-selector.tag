<dialog-selector>
  <script>
    import Dialog from '@/dialog/Ctr'
    import './default-dialog-selector'
    import './default-custom-dialog-selector'

    this.extend(this.opts, this.opts.config)

    const {
      options = [],
      selectorComponent
    } = this.opts

    this.inited = false
    this.dialog = null

    const component = !(options[0] instanceof Array)
      ? 'default-dialog-selector'
      : (selectorComponent || 'default-custom-dialog-selector')

    const init = () => {
      if (this.inited) return
      const { active, select, defaultValue } = this.opts
      this.dialog = new Dialog(component, {
        show: active,
        select,
        options,
        defaultValue,
        ...this.opts.config
      })
      this.inited = true
    }

    this.on('unmount', () => {
      this.dialog && this.dialog.destroy()
    })

    this.on('update', () => {
      if (this.opts.active && !this.inited) {
        init()
      } else {
        this.dialog && this.dialog.update({
          show: this.opts.active
        })
      }
    })
  </script>
</dialog-selector>
