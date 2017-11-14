<form-element class="form__element {'in-valid': !isValid}">
  <div class="element__label"><label for={id}>{opts.label}<yield from="label" /></label></div>
  <!--input, select-->
  <div
    data-is={componentMap[opts.type]}
    id={id}
    on-change={handleChange}
    config={opts.config || opts}
  ></div>

  <script>
    import '@/input'
    import '@/select'
    import '@/datepicker'
    import './group'

    this.extend(this.opts, this.opts.config)

    const {
      index,
      pattern,
      validate = () => true,
      onChange = () => {}
    } = this.opts

    this.id = `_${Math.random().toString(32).slice(2)}`
    this.isValid = true
    this.componentMap = {
      input: 'p-input',
      select: 'p-select',
      checkbox: 'form-group',
      radio: 'form-group',
      switch: 'form-group',
      datepicker: 'date-picker'
    }

    this.handleChange = (...rest) => {
      if (pattern && pattern.test) {
        this.isValid = pattern.test(rest[0])
      } else {
        this.isValid = validate(...rest)
      }
      onChange(this.isValid, index, ...rest)
    }

    this.getValue = () => {
      const tag = this.tags[Object.keys(this.tags)[0]]
      return {
        name,
        value: tag.getValue ? tag.getValue() : 'no implement method'
      }
    }
  </script>
</form-element>
