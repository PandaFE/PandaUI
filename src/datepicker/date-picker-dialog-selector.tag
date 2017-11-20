<date-picker-dialog-selector>
  <p-dialog show={show} position="center" class-name="date-picker-selector">
    <yield to="body">
      <div class="row padding-v-lg">
        <scroll-list
          class-name="col-4"
          options={parent.data[parent.orderIdxes[0]]}
          on-change={parent.handleChange.bind(this, parent.orderIdxes[0])}
          default-value={parent.defaultValue[parent.orderIdxes[0]]}
        ></scroll-list>
        <scroll-list
          class-name="col-4"
          options={parent.data[parent.orderIdxes[1]]}
          on-change={parent.handleChange.bind(this, parent.orderIdxes[1])}
          default-value={parent.defaultValue[parent.orderIdxes[1]]}
        ></scroll-list>
        <scroll-list
          class-name="col-4"
          options={parent.data[parent.orderIdxes[2]]}
          on-change={parent.handleChange.bind(this, parent.orderIdxes[2])}
          default-value={parent.defaultValue[parent.orderIdxes[2]]}
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
      order = 'ymd',
      oldest = 80,
      yongest = 18,
      defaultValue = []
    } = this.opts

    this.show = show
    this.order = order
    this.defaultValue = defaultValue
    this.value = []
    this.data = []
    this.oldValue = []
    this.orderIdxes = [
      'ymd'.indexOf(order.charAt(0)),
      'ymd'.indexOf(order.charAt(1)),
      'ymd'.indexOf(order.charAt(2))
    ]

    this.handleChange = (index, value) => {
      this.value[index] = value
      if (index === 1) {
        this.update({
          data: getData(this.value[0], this.value[1])
        })
      }
    }

    this.cancel = () => {
      select(this.oldValue)
    }

    this.confirm = () => {
      this.oldValue = this.extend([], this.value)
      select(this.value)
    }

    const getDays = (year, month) => {
      let daycount = new Date(year, month, 0).getDate()
      let dayList = this.data[2] || []

      if (daycount !== dayList.length) {
        dayList = []
        for (let i = 0; i < daycount; i++) {
          dayList[i] = i + 1
        }
      }
      return dayList
    }

    const getData = (y, m) => {
      const year = new Date().getFullYear()
      const maxYear = year - yongest
      const minYear = year - oldest

      let yearList = []
      for (let i = maxYear; i >= minYear; i--) {
        yearList[maxYear - i] = i
      }

      let monthList = []
      for (let i = 0; i < 12; i++) {
        monthList[i] = i + 1
      }

      return [yearList, monthList, getDays(y || yearList[0], m || monthList[0])]
    }

    this.data = getData()
  </script>
</date-picker-dialog-selector>
