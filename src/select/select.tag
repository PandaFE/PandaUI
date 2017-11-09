<p-select class={select: true, active: active} onclick={toggle}>
  <label class="select__label">{label}</label>
  <virtual
    data-is={opts.dialog ? 'selector-component' : 'selector-list'}
    active={active}
    config={opts.config || opts}
    select={confirm}
  ></virtual>

  <script>
    import './select.scss'
    import './selector-list'
    import './selector-component'

    this.extend(this.opts, this.opts.config)
    const {
      list,
      format,
      onChange
    } = this.opts

    this.active = false
    this.label = '请选择'
    this.selectedIdxes = -1

    this.toggle = () => {
      this.update({
        active: !this.active
      })
    }

    this.format = (...reset) => {
      return format ? format(...reset) : reset.join(' ')
    }

    this.confirm = (idxes, isArray) => {
      this.selectedIdxes = isArray ? idxes : [idxes]
      applyChange(isArray)
      this.toggle()
    }

    const applyChange = (isArray) => {
      const values = this.selectedIdxes.map((item, index) => {
        return isArray ? list[index][item] : list[item]
      })
      this.label = this.format(...values)
      emitChange(isArray)
    }

    const emitChange = (isArray) => {
      onChange && onChange(this.selectedIdxes)
    }
  </script>
</p-select>
