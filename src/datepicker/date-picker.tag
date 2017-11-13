<date-picker>
  <p-select
    dialog={true}
    on-change={handleChange}
    selector-component="date-picker-dialog-selector"
    options={data}
  ></p-select>

  <script>
    import './date-picker.scss'
    import '@/select'
    import './date-picker-dialog-selector'

    const {
      oldest = 80,
      yongest = 18
    } = this.opts

    this.data = [[], [], []]
    this.value = []

    this.handleChange = value => {
      console.log(value)
    }

    const year = new Date().getFullYear()
    const maxYear = year - yongest
    const minYear = year - oldest

    let yearList = []
    for (let i = minYear; i < maxYear + 1; i++) {
      yearList[i - minYear] = i
    }

    let monthList = []
    for (let i = 0; i < 12; i++) {
      monthList[i] = i + 1
    }

    const getDays = (year, month) => {
      let daycount = new Date(year, month, 0).getDate()
      let dayList = this.data[2]

      if (daycount !== dayList.length) {
        dayList = []
        for (let i = 0; i < daycount; i++) {
          dayList[i] = i + 1
        }
      }
      return dayList
    }

    this.data = [yearList, monthList, getDays(yearList[0], monthList[0])]
  </script>
</date-picker>
