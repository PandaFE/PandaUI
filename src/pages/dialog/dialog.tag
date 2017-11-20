<page-dialog class="sample-page">
  <p-dialog ref="dialog" component="sample-dialog" />
  <p-button onclick={openDialog}>Open dialog</p-button>

  <script>
    import '@/dialog'
    import './sample-dialog'

    this.openDialog = () => {
      this.refs.dialog.show()
    }
  </script>
</page-dialog>
