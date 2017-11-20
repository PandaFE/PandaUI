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
    let stateArr = []

    this.getValue = () => {
      return this.tags['form-element'].map(item => {
        return item.getValue()
      })
    }

    this.handleChange = (isValid, index, value) => {
      if (isValid) {
        stateArr[index] = 0
      } else {
        stateArr[index] = 1
      }
      onChange(!stateArr.reduce((sum, value) => (sum + value), 0))
    }
  </script>
</p-form>
