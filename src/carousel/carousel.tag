<carousel>
  <div class="carousel">
    <ul ref="stage" class="carousel__stage" style={{ height: height + 'px'}}>
      <li class="carousel__item" each={ opts.item } >
        <yield/>
      </li>
    </ul>
  </div>

  <script>
    import './carousel.scss'
    import Swipe from '@/local_modules/Swipe'

    let {
      itemHeight = 200,
      itemWidth = 200,
      itemMarginr = 0
    } = this.opts.carousel
    itemWidth += itemMarginr
    let $stage = null // 触摸对象
    let swipeWidth = 0
    let itemCount = 0
    let itemInView = 0

    this.height = itemHeight

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

    this.on('mount', () => {
      $stage = this.refs.stage
      itemCount = $stage.children.length
      swipeWidth = $stage.parentElement.clientWidth
      itemInView = Math.min(Math.ceil(swipeWidth / itemWidth), itemCount)
      closeTrap()
      /* eslint-disable no-new */
      new Swipe({
        target: $stage,
        loop: {
          start: -itemInView * itemWidth,
          end: swipeWidth - (itemInView + itemCount) * itemWidth,
          min: swipeWidth - (itemInView * itemWidth),
          max: -(itemInView + itemCount) * itemWidth
        },
        start: () => {},
        move: () => {},
        end: (start, offset) => {
          console.log('swipe end', start, offset)
        }
      })
    })
  </script>
</carousel>
