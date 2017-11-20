<alert>
  <script>
    import './alert.scss'
    import Alert from './Ctr'

    const {
      component,
      duration = 3
    } = this.opts

    let timeout = null
    this.alert = new Alert(component || this.opts, this.opts)
    this.on('unmount', () => {
      if (this.alert) {
        this.alert.destroy()
        clearTimeout(timeout)
      }
    })

    this.show = message => {
      this.alert.update({ message, show: true })
      clearTimeout(timeout)
      timeout = setTimeout(() => {
        this.alert.hide()
      }, 1000 * duration)
    }
  </script>
</alert>
