<default-dialog-selector>
  <p-dialog show={show} position="center" class-name="selector">
    <yield to="body">
      <ul class="select__list popup" onclick={parent.handleClick}>
        <li each={item, index in parent.opts.options} class="select__option" data-index={index} key={index}>
          {parent.parent.format(item)}
        </li>
      </ul>
      </div>
    </yield>
  </p-dialog>

  <script>
    import '@/dialog'

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
</default-dialog-selector>
