<sample>
  <img src='/img/logo.png' alt="">
  <div>jojo</div>
  <div>jo</div>
  <list data={this.list} />

  <script>
    import '@/button'
    import '@/list'

    this.list = [1, 2, 3]

    this.on('route', () => {
      console.log('routed to /')
    })
  </script>
</sample>
