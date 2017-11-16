<form-group  class="element__group">
  <!--checkbox radio and switch-->
  <toggle
    if={isToggle}
    each={item, index in opts.options}
    config={parent.extend({}, parent.opts.config || parent.opts, item)}
    id={parent.opts.id + index}
    on-change={parent.handleChange}
    key={index}
  ></toggle>

  <script>
    import '@/toggle'

    this.extend(this.opts, this.opts.config)

    const {
      options,
      type
    } = this.opts

    let values = {}
    let subTagChangeInvoke = 0
    let shouldEmitChange = false

    this.isToggle = ~['checkbox', 'radio', 'switch'].indexOf(type)

    this.getValue = () => {
      if (this.isToggle) {
        return this.tags.toggle.map(item => {
          const result = item.getValue()
          return result.checked ? result.value : ''
        }).filter(item => item)
      }
    }

    this.handleChange = (...rest) => {
      if (this.isToggle) {
        const [value, state] = rest
        if (state) {
          values[value] = true
        } else {
          delete values[value]
        }
      }
      emitChange()
    }

    const emitChange = () => {
      if (!shouldEmitChange && ++subTagChangeInvoke === options.length) {
        shouldEmitChange = true
      }
      if (shouldEmitChange) {
        this.opts.onChange(Object.keys(values))
      }
    }
  </script>
</form-group>
