<selector-list>
  <ul
    show={active}
    class={select__list: true, float: opts.float}
    onclick={handleClick}
  >
    <li
      each={item, index in opts.list}
      class={select__option: true, active: activeIdx === index}
      data-index={index}
      key={index}
    >{format(item)}</li>
  </ul>

  <script>
    this.extend(this.opts, this.opts.config)
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
      this.activeIdx = Number(evt.target.dataset.index)
      select(this.activeIdx)
    }
  </script>
</selector-list>
