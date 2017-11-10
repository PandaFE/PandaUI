<selector-list>
  <ul
    show={active}
    class={select__list: true, float: opts.float}
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
      select = () => {}
    } = this.opts

    this.activeIdx = -1

    this.format = item => {
      return format ? format(item) : (item.label || item)
    }

    this.handleClick = (evt) => {
      evt.stopPropagation()
      this.applyChange(evt.target.dataset.index)
    }

    this.applyChange = (index = this.findDefault()) => {
      this.activeIdx = Number(index)
      if (~this.activeIdx) {
        select(this.activeIdx)
      }
    }
  </script>
</selector-list>
