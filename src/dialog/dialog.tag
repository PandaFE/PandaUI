<p-dialog>
  <script>
    import './dialog.scss'
    import Dialog from '@/local_modules/Component'

    this.extend(this.opts, this.opts.config)

    const {
      component
    } = this.opts

    const init = () => {
      this.dialog = new Dialog(component || this.opts, this.opts)
    }

    this.show = () => {
      if (!this.dialog) {
        init()
      }
      this.dialog.show()
    }

    this.hide = () => {
      if (this.dialog) {
        this.dialog.hide()
      }
    }

    this.on('unmount', () => {
      if (this.dialog) {
        this.dialog.destroy()
      }
    })
  </script>
</p-dialog>
