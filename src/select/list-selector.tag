<list-selector>
  <ul
    show={active}
    class={select__list: true, float: !opts.static}
    onclick={handleClick}
  >
    <li
      each={item, index in opts.options}
      class={select__option: true, active: activeIdx === index}
      data-index={index}
      key={index}
    >{format(item)}</li>
  </ul>

  <script>
    this.mixin('form-element')

    const {
      format,
      options,
      select = () => {}
    } = this.opts

    this.activeIdx = this.findDefault()

    this.format = item => {
      return format ? format(item) : (item.label || item)
    }

    this.handleClick = (evt) => {
      evt.stopPropagation()
      this.applyChange(evt.target.dataset.index)
    }

    this.applyChange = (index = this.activeIdx) => {
      this.activeIdx = Number(index)
      if (~this.activeIdx) {
        select(options[this.activeIdx])
      }
    }
  </script>
</list-selector>
