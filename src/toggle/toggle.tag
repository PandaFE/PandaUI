<toggle class="toggle">
  <label class="toggle__label {opts.type}">
    <input
      ref="input"
      class="hide"
      type={opts.type === 'radio' ? 'radio' : 'checkbox'}
      name={opts.name}
      onchange={handleChange}
      checked={opts.checked}
      disabled={opts.disabled}
    />
    <span class="toggle__outline inner-inline-block {disabled: opts.disabled}"></span>
    <span class="toggle__text inner-inline-block"><yield />{opts.label}</span>
  </label>

  <script>
    import './toggle.scss'
    this.mixin('form-element')

    const {
      onChange = () => {}
    } = this.opts

    this.handleChange = evt => {
      this.applyChange(evt.target.checked)
    }

    this.applyChange = (state = !!this.opts.checked) => {
      onChange(this.opts.value, state)
    }

    this.getValue = () => {
      return {
        value: this.opts.value,
        checked: this.refs.input.checked
      }
    }
  </script>
</toggle>
