<form-element class="form__element">
  <div class="element__label"><label for={id}>{opts.label}<yield from="label" /></label></div>
  <!--input, select-->
  <div
    data-is={componentMap[opts.type]}
    config={opts.config || opts}
    id={id}
    on-change={handleChange}
  ></div>

  <script>
    import '@/input'
    import '@/select'
    import './group'

    this.extend(this.opts, this.opts.config)

    const { name, type } = this.opts

    this.id = `_${Math.random().toString(32).slice(2)}`
    this.componentMap = {
      input: 'p-input',
      select: 'p-select',
      checkbox: 'form-group',
      radio: 'form-group',
      switch: 'form-group'
    }

    this.handleChange = (...reset) => {
      console.log(name, type, ...reset)
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
