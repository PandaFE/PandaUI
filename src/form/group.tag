<form-group  class="element__group">
  <!--checkbox radio and switch-->
  <toggle
    if={isToggle}
    each={item, index in opts.options}
    config={parent.extend({}, parent.opts.config || parent.opts, item)}
    id={parent.opts.id + index}
    on-change={parent.opts.onChange}
    key={index}
  ></toggle>

  <script>
    import '@/toggle'

    this.extend(this.opts, this.opts.config)

    this.isToggle = ~['checkbox', 'radio', 'switch'].indexOf(this.opts.type)

    this.getValue = () => {
      if (this.isToggle) {
        return this.tags.toggle.map(item => {
          const result = item.getValue()
          return result.checked ? result.value : ''
        }).filter(item => item)
      }
    }
  </script>
</form-group>
