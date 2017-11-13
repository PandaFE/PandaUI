<selector-dialog>
  <p-dialog show={show} position="center" class-name="selector">
    <yield to="body">
      <ul if={!parent.isMultiCols} class="select__list popup" onclick={parent.handleClick}>
        <li each={item, index in parent.opts.options} class="select__option" data-index={index} key={index}>
          {parent.parent.format(item)}
        </li>
      </ul>
      <div if={parent.isMultiCols} class="row padding-v-lg">
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
      <p-button if={parent.isMultiCols} onclick={parent.confirm}>OK</p-button>
    </yield>
  </p-dialog>

  <script>
    import '@/dialog'
    import '@/button'
    import '@/scrolllist'

    const {
      options,
      show,
      select = () => {},
      format = item => item
    } = this.opts

    this.show = show
    this.isMultiCols = !!(options[0] && options[0] instanceof Array)
    this.format = format

    this.handleClick = evt => {
      select(Number(evt.target.dataset.index))
    }

    this.confirm = () => {
      select()
    }
  </script>
</selector-dialog>
