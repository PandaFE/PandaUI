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

    this.getValue = () => {
      return this.tags['form-element'].map(item => {
        return item.getValue()
      })
    }

    this.handleChange = (...rest) => {
      console.log(...rest)
    }
  </script>
</p-form>
