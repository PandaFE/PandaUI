<scroll-list class="scroll__list-outer">
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

    this.extend(this.opts, this.opts.config)

    this.activeIndex = 0

    const {
      distance = 40
    } = this.opts

    this.on('mount', () => {
      const list = new Swipe({
        target: this.refs.list,
        begin: distance * 2,
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
          list.move(pos, true)
          this.update({
            activeIndex: this.activeIndex - pos / distance
          })
          return false
        }
      })
    })
  </script>
</scroll-list>
