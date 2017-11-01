<p-carousel>
  <div class="carousel">
    <ul class={ opts.claxx } style={{ width: opts.item.length * (itemWidth + itemMarginr) + 'px' }}>
      <li class={ opts.itemclaxx } each={ opts.item } >
        <yield/>
      </li>
    </ul>
  </div>

  <script>
    import './carousel.scss'
    this.speed = this.opts.carousel.speed || 3000
    this.duration = this.opts.carousel.duration || 3000
    this.itemWidth = this.opts.carousel.itemWidth || 100
    this.itemMarginr = this.opts.carousel.itemMarginr || 6
    this.timer = setInterval(
      () => {
        let nodeUl = document.getElementsByClassName(this.opts.claxx)[0]
        let nodeLi = document.getElementsByClassName(this.opts.itemclaxx)[0]
        nodeUl.style.left = -(this.itemWidth + this.itemMarginr) + 'px'
        nodeUl.style.transition = 'all .' + this.duration / 1000 + 's linear'
        // nodeLi.cloneNode(true)
        nodeUl.appendChild(nodeLi)
        nodeUl.style.left = 0
      },
      this.speed
    )
    this.on('unmount', () => {
      clearInterval(this.timer)
    })
  </script>
</p-carousel>
