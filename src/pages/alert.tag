<page-alert class="sample-page">
  <alert ref="alert" />
  <p-button onclick={showAlert}>show alert</p-button>

  <script>
    import '@/alert'

    this.on('mount', () => {
      this.alert = this.refs.alert

      this.showAlert = () => {
        this.alert.show(Math.random().toString())
      }
    })
  </script>
</page-alert>
