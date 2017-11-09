<p-dialog show={opts.show} class={dialog__mask: true, show: !opts.noMask}>
  <div class="dialog {opts.position || 'top'}">
    <div class="dialog__header"><yield from="header" /></div>
    <div class="dialog__body text-center"><yield from="body" /></div>
    <div class="dialog__footer"><yield from="footer" /></div>
  </div>

  <script>
    import './dialog.scss'
  </script>
</p-dialog>
