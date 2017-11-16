<p-form class="form__outer">
  <form class="form">
    <form-element
      each={el, index in opts.elements}
      on-change={parent.handleChange}
      no-reorder
      config={el}
      key={index}
      index={index}
    ></form-element>
  </form>

  <script>
    import './element'

    const {
      onChange = () => {}
    } = this.opts
    let inValidCode = 0

    this.getValue = () => {
      return this.tags['form-element'].map(item => {
        return item.getValue()
      })
    }

    this.handleChange = (isValid, index, value) => {
      if (isValid) {
        inValidCode -= index + 1
      } else {
        inValidCode += index + 1
      }
      if (inValidCode < 0) {
        inValidCode = 0
      }
      onChange(!inValidCode)
    }
  </script>
</p-form>
