<p-form class="form__outer">
  <form class="form">
    <form-element each={el in opts.elements} config={el} no-reorder></form-element>
  </form>

  <script>
    import './element'

    this.getValue = () => {
      return this.tags['form-element'].map(item => {
        return item.getValue()
      })
    }

    this.on('mount', () => {
      console.log(this.getValue())
    })
  </script>
</p-form>
