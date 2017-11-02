<p-carousel>
  <div class="carousel">
    <ul class={ opts.claxx } style={{ width: opts.item.length * (itemWidth + itemMarginr) + 'px', height: itemHeight + 'px' }}>
      <li class={ opts.itemclaxx } each={ opts.item } >
        <yield/>
      </li>
    </ul>
  </div>

  <script>
    import './carousel.scss'
    import Swipe from '@/local_modules/Swipe'

    /* eslint-disable no-new */
    new Swipe()
    this.speed = this.opts.carousel.speed || 3000 // 间隔时间
    this.duration = this.opts.carousel.duration || 3000 // 动画时长
    this.itemWidth = this.opts.carousel.itemWidth || 200 // li 宽度
    this.itemMarginr = this.opts.carousel.itemMarginr || 6 // li 间距
    this.itemHeight = this.opts.carousel.itemHeight || 200 // li 高度
    this.on('mount', () => {
      this.nodeUl = document.getElementsByClassName(this.opts.claxx)[0]
      if (document.getElementsByClassName('carousel')[0].clientWidth < this.nodeUl.clientWidth) {
        this.autoplay()
      } else {
        this.nodeUl.style.left = 0
        this.nodeUl.style.textAlign = 'center'
        this.nodeUl.style.margin = 'auto'
        this.nodeUl.style.position = 'static'
        document.getElementsByClassName(this.opts.itemclaxx)[0].style.display = 'indline-block'
      }
    })
    this.autoplay = () => {
      this.timer = setInterval(
        () => {
          let nodeLi = document.getElementsByClassName(this.opts.itemclaxx)[0]
          this.nodeUl.style.left = -(this.itemWidth + this.itemMarginr) + 'px'
          this.nodeUl.style.transition = 'all .' + this.duration / 1000 + 's linear'
          // let nodeClone = nodeLi.cloneNode(true)
          this.nodeUl.addEventListener('transitionend', () => {
            this.nodeUl.style.transition = 'none'
            this.nodeUl.appendChild(nodeLi)
            this.nodeUl.style.left = 0
            // nodeLi.remove()
          })
        },
        this.speed
      )
    }
    this.on('unmount', () => {
      clearInterval(this.timer)
      clearInterval(this.timer2)
    })
  </script>
</p-carousel>
