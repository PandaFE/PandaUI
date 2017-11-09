<selector-dialog>
  <p-dialog show={show} position="center">
    <yield to="body">
      <ul if={!parent.isMultiCols} class="select__list popup" onclick={parent.handleClick}>
        <li each={item, index in parent.opts.list} class="select__option" data-index={index} key={index}>
          {parent.parent.format(item)}
        </li>
      </ul>
    </yield>
    <yield if={parent.isMultiCols} to="footer">
      <p-button onclick={parent.confirm}>OK</p-button>
    </yield>
  </p-dialog>

  <script>
    import '@/dialog'
    import '@/button'

    const {
      list,
      show,
      select = () => {},
      format = item => item
    } = this.opts

    this.show = show
    this.isMultiCols = !!(list[0] && list[0][0])
    this.format = format

    this.handleClick = evt => {
      select(Number(evt.target.dataset.index))
    }

    this.confirm = () => {
      select()
    }
  </script>
</selector-dialog>
