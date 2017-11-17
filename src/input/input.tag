<p-input class="input__outer">
  <input
    ref='input'
    class="input"
    type="text"
    name={opts.name}
    value={opts.defaultValue}
    onkeydown={handleChange}
  />

  <script>
    import './input.scss'
    import debounce from 'lodash/debounce'

    this.mixin('form-element')

    this.handleChange = debounce(evt => {
      this.applyChange(evt.target.value)
    }, 300, {
      maxWait: 1000
    })

    this.applyChange = (value = this.opts.defaultValue || '') => {
      this.opts.onChange(value.trim())
    }

    this.getValue = () => {
      return this.refs.input.value.trim()
    }
  </script>
</p-input>
