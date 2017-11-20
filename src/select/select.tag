<p-select class={select: true, active: active} onclick={toggle}>
  <input type="hidden" name={opts.name}>
  <label class="select__label">{label}</label>
  <virtual
    data-is={opts.dialog ? 'dialog-selector' : 'list-selector'}
    active={active}
    select={confirm}
    config={opts.config || opts}
  ></virtual>

  <script>
    import './select.scss'
    import './list-selector'
    import './dialog-selector'

    this.extend(this.opts, this.opts.config)
    const {
      format = value ={
        if (value.join) return value.join(' ')
        return value.label || value || '请选择'
      },
      onChange = () => {},
      defaultValue = []
    } = this.opts

    let values = defaultValue
    this.active = false
    this.label = '请选择'

    this.toggle = state => {
      this.update({
        active: state === false ? false : !this.active
      })
    }

    this.format = value => {
      return format(value)
    }

    this.confirm = value => {
      values = value
      applyChange(values)
      this.toggle(false)
    }

    this.getValue = () => {
      return values
    }

    const applyChange = (...values) => {
      this.update({
        label: this.format(...values)
      })
      onChange(...values)
    }

    this.on('mount', () => {
      // dialog惰性加载 因此需要手动渲染初始化的值
      if (this.opts.dialog) {
        applyChange(values)
      }
    })
  </script>
</p-select>
