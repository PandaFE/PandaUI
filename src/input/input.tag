<p-input class="input__outer">
  <input
    ref='input'
    class="input"
    type="text"
    name={opts.name}
    value={opts.default}
    onchange={handleChange}
  />

  <script>
    import './input.scss'

    this.mixin('form-element')

    this.handleChange = evt => {
      this.applyChange(evt.target.value)
    }

    this.applyChange = (value = this.opts.default) => {
      this.opts.onChange(value.trim())
    }

    this.getValue = () => {
      return this.refs.input.value.trim()
    }
  </script>
</p-input>
