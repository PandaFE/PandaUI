<date-picker-dialog-selector>
  <p-dialog show={show} position="center" class-name="date-picker-selector">
    <yield to="body">
      <div class="row padding-v-lg">
        <scroll-list
          class-name="col-4"
          options={parent.opts.options[parent.order.indexOf('y')]}
          on-change={parent.handleChange.bind(this, parent.order.indexOf('y'))}
        ></scroll-list>
        <scroll-list
          class-name="col-4"
          options={parent.opts.options[parent.order.indexOf('m')]}
          on-change={parent.handleChange.bind(this, parent.order.indexOf('m'))}
        ></scroll-list>
        <scroll-list
          class-name="col-4"
          options={parent.opts.options[parent.order.indexOf('d')]}
          on-change={parent.handleChange.bind(this, parent.order.indexOf('d'))}
        ></scroll-list>
      </div>
    </yield>
    <yield to="footer">
      <div class="row text-center margin-top-md">
        <div class="col-6 date-picker__btn" onclick={parent.cancel}>取消</div>
        <div class="col-6 date-picker__btn" onclick={parent.confirm}>确认</div>
      </div>
    </yield>
  </p-dialog>

  <script>
    import '@/dialog'
    import '@/button'
    import '@/scrolllist'

    const {
      show,
      select = () => {},
      order = 'ymd'
    } = this.opts

    this.show = show
    this.order = order
    this.value = []

    this.handleChange = (index, value) => {
      this.value[index] = value
    }

    this.cancel = () => {
      this.show = false
    }

    this.confirm = () => {
      console.log('jojo')
      select(this.value, true)
    }
  </script>
</date-picker-dialog-selector>
