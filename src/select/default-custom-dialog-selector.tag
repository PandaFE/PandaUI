<default-custom-dialog-selector>
  <p-dialog show={show} position="center" class-name="selector">
    <yield to="body">
      <div class="row padding-v-lg">
        <div
          each={option, index in parent.opts.options}
          class="column col-{12 / parent.parent.opts.options.length}"
          key={index}
        >
          <scroll-list options={option} config={parent.parent.opts.config || parent.parent.opts}></scroll-list>
        </div>
      </div>
    </yield>
    <yield to="footer">
      <p-button onclick={parent.confirm}>OK</p-button>
    </yield>
  </p-dialog>

  <script>
    import '@/dialog'
    import '@/button'
    import '@/scrolllist'

    const {
      show,
      select = () => {},
      format = item => item
    } = this.opts

    this.show = show
    this.format = format

    this.handleClick = evt => {
      select(Number(evt.target.dataset.index))
    }

    this.confirm = () => {
      select()
    }
  </script>
</default-custom-dialog-selector>
