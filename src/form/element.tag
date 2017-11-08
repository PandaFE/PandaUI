<form-element>
  <div class="element__label">
    <label for={id}>
      {opts.label}
      <yield from="label" />
    </label>
  </div>
  <p-input if={opts.type === 'input'} config={opts} id={id}></p-input>
  <p-select if={opts.type === 'select'} config={opts} id={id}></p-select>
  <toggle if={~['checkbox', 'radio', 'switch'].indexOf(opts.type)} config={opts} id={id}></toggle>

  <script>
    import '@/input'
    import '@/select'
    import '@/toggle'

    this.opts = this.opts.config || {}
    this.id = `_${Math.random().toString(32).slice(2)}`
  </script>
</form-element>
