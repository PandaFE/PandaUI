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
      name,
      index,
      required,
      pattern,
      validate,
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

    const isValid = (...rest) => {
      const [value] = rest
      if (validate) {
        return validate(...rest)
      }
      if (required) {
        return value && (value.join ? value.join('') : value.toString().trim())
      }
      if (pattern) {
        return pattern.test ? pattern.test(value) : true
      }
      return true
    }

    this.handleChange = (...rest) => {
      onChange(!!isValid(...rest), index, ...rest)
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
