<default-dialog-selector>
  <dialog-template show={show} position="center" class-name="selector">
    <yield to="body">
      <ul class="select__list popup" onclick={parent.handleClick}>
        <li each={item, index in parent.opts.options} class="select__option" data-index={index} key={index}>
          {parent.parent.format(item)}
        </li>
      </ul>
      </div>
    </yield>
  </dialog-template>

  <script>
    import '@/dialog/dialog-template'

    const {
      show,
      options,
      select = () => {},
      format = item => item
    } = this.opts

    this.show = show
    this.format = format

    this.handleClick = evt => {
      select(options[Number(evt.target.dataset.index)])
    }

    this.confirm = () => {
      select()
    }
  </script>
</default-dialog-selector>
