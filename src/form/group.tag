<form-group  class="element__group">
  <!--checkbox radio and switch-->
  <toggle
    if={isToggle}
    each={item, index in opts.options}
    config={parent.getConfig(item)}
    id={parent.opts.id + index}
    on-change={parent.handleChange}
    key={index}
  ></toggle>

  <script>
    import '@/toggle'

    this.extend(this.opts, this.opts.config)

    const {
      options,
      type,
      labelField = 'label',
      valueField = 'value'
    } = this.opts

    let values = {}
    let subTagChangeInvoke = 0
    let shouldEmitChange = false

    this.isToggle = ~['checkbox', 'radio', 'switch'].indexOf(type)

    this.getConfig = item => {
      if (!item.label) {
        item = {
          label: item[labelField] || item,
          value: item[valueField] || item
        }
      }
      return this.extend({}, this.opts.config || this.opts, item)
    }

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
