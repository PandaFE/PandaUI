<page-dialog class="sample-page">
  <script>
    import './sample-dialog'
    import Dialog from '@/dialog/Ctr'

    const dialog = new Dialog('sample-dialog')

    this.on('unmount', () => {
      dialog.destroy()
    })
  </script>
</page-dialog>
