<selector-component>
  <script>
    import Dialog from '@/dialog/Ctr'
    import './selector-dialog'

    this.extend(this.opts, this.opts.config)

    this.inited = false
    this.dialog = null

    const init = () => {
      if (this.inited) return
      this.dialog = new Dialog('selector-dialog', {
        show: this.opts.active,
        select: this.opts.select,
        options: this.opts.options || []
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
        this.dialog.update({
          show: this.opts.active
        })
      }
    })
  </script>
</selector-component>
