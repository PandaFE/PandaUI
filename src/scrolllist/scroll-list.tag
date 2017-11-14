<scroll-list class="scroll__list-outer {opts.className}">
  <ul ref="list" class="scroll__list">
    <li
      each={item, index in opts.options}
      class="scroll__item {active: index === activeIndex}"
      key={index}
      data-index={index}
    >{item}</li>
  </ul>

  <script>
    import './scroll-list.scss'
    import Swipe from '@/local_modules/Swipe'

    this.mixin('form-element')

    const {
      distance = 40,
      options,
      onChange = () => {},
      defaultValue
    } = this.opts

    const defaultIndex = defaultValue ? this.findDefault(defaultValue) : -1
    this.activeIndex = ~defaultIndex ? defaultIndex : 0

    this.on('mount', () => {
      this.list = new Swipe({
        target: this.refs.list,
        begin: distance * (2 - this.activeIndex),
        max: distance * 2,
        min: -distance * this.opts.options.length + distance * 3,
        axis: 'y',
        end: (start, offset) => {
          if (!offset) {
            return
          }
          const absOffset = Math.abs(offset)
          const dir = offset / absOffset
          const pos = distance * (Math.floor(absOffset / distance) + (absOffset % distance > distance >> 2 ? 1 : 0)) * dir
          this.list.move(pos, true)
          this.update({
            activeIndex: this.activeIndex - pos / distance
          })
          onChange(options[this.activeIndex])
          return false
        }
      })
    })

    this.applyChange = () => {
      onChange(options[this.activeIndex])
    }

    this.on('update', () => {
      if (this.activeIndex > this.opts.options.length - 1) {
        this.activeIndex = this.opts.options.length - 1
        this.applyChange()
        if (this.list) {
          const min = -distance * this.opts.options.length + distance * 3
          this.list.setOptions({min})
          this.list.move(min)
        }
      }
    })
  </script>
</scroll-list>
