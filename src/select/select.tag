<p-select class={select: true, active: active} onclick={toggle}>
  <input type="hidden" name={opts.name}>
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
    let selectedIdxes = [-1]
    const {
      options,
      format,
      onChange
    } = this.opts

    this.active = false
    this.label = '请选择'

    this.toggle = state => {
      this.update({
        active: state === false ? false : !this.active
      })
    }

    this.format = (...reset) => {
      return format ? format(...reset) : reset.join(' ')
    }

    this.confirm = (idxes, isArray) => {
      selectedIdxes = isArray ? idxes : [idxes]
      applyChange(isArray)
      this.toggle(false)
    }

    this.getValue = () => {
      return selectedIdxes
    }

    const applyChange = (isArray) => {
      const values = selectedIdxes.map((item, index) => {
        return isArray ? options[index][item] : options[item]
      })
      this.label = this.format(...values)
      emitChange(isArray)
    }

    const emitChange = (isArray) => {
      onChange && onChange(selectedIdxes)
    }
  </script>
</p-select>
