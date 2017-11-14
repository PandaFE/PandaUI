<date-picker>
  <p-select
    dialog={true}
    on-change={handleChange}
    config={config}
  ></p-select>

  <script>
    import './date-picker.scss'
    import '@/select'
    import './date-picker-dialog-selector'

    this.extend(this.opts, this.opts.config)

    const {
      onChange = () => {}
    } = this.opts

    this.data = [[], [], []]
    this.value = null

    this.handleChange = value => {
      this.value = value
      onChange(value)
    }
    // 组装特殊的config对象
    this.config = this.extend({
      selectorComponent: 'date-picker-dialog-selector'
    }, this.opts.config || this.opts)

    this.getValue = () => {
      return this.value
    }
  </script>
</date-picker>
