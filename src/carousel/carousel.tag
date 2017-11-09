<carousel class="carousel">
  <ul ref="stage" class="carousel__stage" style={{ height: height + 'px'}}>
    <li class="carousel__item" each={ opts.item } >
      <yield/>
    </li>
  </ul>

  <script>
    import './carousel.scss'
    import Swipe from '@/local_modules/Swipe'

    let {
      itemHeight = 200,
      itemWidth = 200,
      itemMarginr = 0,
      threshold = 50,
      timeout = 2000
    } = this.opts.carousel || {}
    let $stage = null // 触摸对象
    let swipeWidth = 0
    let itemCount = 0
    let itemInView = 0
    itemWidth += itemMarginr
    this.height = itemHeight
    this.interval = null
    this.swiper = null

    const clone = (nodes, start, end) => {
      let fragment = new DocumentFragment()
      for (let i = start; i < end; i++) {
        let el = $stage.children[i].cloneNode(true)
        el.className += ' cloned'
        fragment.appendChild(el)
      }
      return fragment
    }

    const closeTrap = () => {
      $stage.style.display = 'none'
      $stage.appendChild(clone($stage.children, 0, itemInView))
      $stage.insertBefore(clone($stage.children, itemCount - itemInView, itemCount), $stage.children[0])
      $stage.style.width = `${itemWidth * $stage.children.length}px`
      $stage.style.display = 'block'
    }

    const setup = () => {
      this.interval = setInterval(() => {
        this.swiper.move(-itemWidth, true)
      }, timeout)
    }

    const stop = () => {
      clearInterval(this.interval)
    }

    this.on('mount', () => {
      $stage = this.refs.stage
      itemCount = $stage.children.length
      swipeWidth = $stage.parentElement.clientWidth
      itemInView = Math.min(Math.ceil(swipeWidth / itemWidth), itemCount)
      closeTrap()
      /* eslint-disable no-new */
      this.swiper = new Swipe({
        target: $stage,
        loop: {
          start: -itemInView * itemWidth,
          end: swipeWidth - (itemInView + itemCount) * itemWidth,
          max: swipeWidth - (itemInView * itemWidth),
          min: -(itemInView + itemCount) * itemWidth
        },
        start: () => {
          stop()
        },
        end: (start, offset) => {
          const absOffset = Math.abs(offset)
          const dir = offset / absOffset
          this.swiper.move(itemWidth * (Math.floor(absOffset / itemWidth) + (absOffset >= threshold ? 1 : 0)) * dir, true)
          setup()
          return false
        }
      })
      setup()
    })

    this.on('unmount', () => {
      stop()
    })
  </script>
</carousel>
