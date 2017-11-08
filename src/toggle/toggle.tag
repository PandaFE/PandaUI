<toggle>
  <label class="toggle__label {opts.type}">
    <input class="hide" type={opts.type === 'radio' ? 'radio' : 'checkbox'} />
    <span class="toggle__outline inner-inline-block"></span>
    <span class="toggle__text inner-inline-block">这是label的内容</span>
  </label>

  <script>
    import './toggle.scss'
    this.opts = this.opts.config || {}
  </script>
</toggle>
