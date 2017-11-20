<sample-dialog>
  <dialog-template position="center" show={show}>
    <yield to="header">
      <div class="margin-md">title</div>
    </yield>
    <yield to="body">
      <div class="margin-lg">dialog content</div>
    </yield>
    <yield to="footer">
      <p-button onclick={parent.close}>Close dialog</p-button>
    </yield>
  </dialog-template>

  <script>
    import '@/dialog/dialog-template'

    this.show = false

    this.close = () => {
      this.show = false
    }
  </script>
</sample-dialog>
