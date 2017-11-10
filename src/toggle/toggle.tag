<toggle class="toggle">
  <label class="toggle__label {opts.type}">
    <input
      ref="input"
      class="hide"
      type={opts.type === 'radio' ? 'radio' : 'checkbox'}
      name={opts.name}
      onchange={handleChange}
      checked={opts.checked}
    />
    <span class="toggle__outline inner-inline-block"></span>
    <span class="toggle__text inner-inline-block">{opts.label}</span>
  </label>

  <script>
    import './toggle.scss'
    this.mixin('form-element')

    this.handleChange = evt => {
      this.applyChange(evt.target.checked)
    }

    this.applyChange = (state = !!this.opts.checked) => {
      this.opts.onChange(this.opts.value, state)
    }

    this.getValue = () => {
      return {
        value: this.opts.value,
        checked: this.refs.input.checked
      }
    }
  </script>
</toggle>
