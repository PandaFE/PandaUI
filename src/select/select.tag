<p-select>
  <div class={opts.type ? 'select-component-pc' : 'select-component'}>
    <div class={opts.type ? 'select-component-labal-pc' : 'select-component-labal'} click={ toggle }>
      <yield from="select" />
    </div>
    <ul if={ opts.type && isShow } class='select-component-option-wrap-pc'>
      <li class="select-component-option-pc" each={ item in opts.data} click={ change.bind(null, item) }>
        <yield from="option" />
      </li>
    </ul>
    <div class="select-component-mask" if={ isShow } click={ cancel } />
    <div if={!opts.type && isShow} class="select-component-option-wrap">
      <div class="select-component-controls">
        <div class="select-component-cancel" click={cancel}>取消</div>
        <div class="select-component-confirm" click={confirm}>确认</div>
      </div>
      <div class="select-component-columns">
        <div class="select-component-column">
          <ul
            class="select-component-panel"
            touchstart={selectTouchstart}
            touchmove={selectTouchmove}
            touchend={selectTouchend}
            style={ panelStyle }
          >
            <li
              each={item, i in opts.data}
              class={ i === activeIndex ? 'select-component-option active' : 'select-component-option'}
            >
              <yield from="option" />
            </li>
          </ul>
          <div class="select-component-selected" />
        </div>
      </div>
    </div>
  </div>
  <script>
    import './select.scss'

    this.isShow = false
    this.touchEventsY = 0
    this.panelStyle = {
      top: '80px'
    }
    this.activeIndex = 0
    this.change = (item) => {
      this.update({ isShow: !this.isShow })
      this.opts.change(item, this.isShow)
    }

    this.toggle = () => {
      this.update({ isShow: !this.isShow })
      this.opts.change(null, this.isShow)
    }

    this.selectTouchstart = (e) => {
      e.preventDefault()
      this.touchEventsY = e.changedTouches[0].pageY
    }

    this.selectTouchmove = (e) => {
      e.preventDefault()
      let distance = e.changedTouches[0].pageY - this.touchEventsY
      if (distance > 0) {
        this.panelStyle.top = distance + parseInt(this.panelStyle.top) > 80
          ? '80px'
          : distance + parseInt(this.panelStyle.top) + 'px'
      } else {
        this.panelStyle.top = distance + parseInt(this.panelStyle.top) < 80 - (this.opts.data.length - 1) * 40
          ? -(this.opts.data.length - 1) * 40 + 80 + 'px'
          : distance + parseInt(this.panelStyle.top) + 'px'
      }
    }

    this.selectTouchend = (e) => {
      e.preventDefault()
      const topValue = parseInt(this.panelStyle.top)
      this.activeIndex = topValue >= 0 ? ((topValue >= 40 * 2) ? 0 : ((topValue % 40) <= (40 / 2) ? -parseInt(topValue / 40) + 2 : -parseInt(topValue / 40) + 1)) : ((topValue <= -40 * (this.opts.data.length - 3)) ? this.opts.data.length - 1 : ((-topValue % 40) <= (40 / 2) ? parseInt(-topValue / 40) + 2 : parseInt(-topValue / 40) + 3))
      this.panelStyle.top = 80 - this.activeIndex * 40 + 'px'
    }

    this.cancel = (e) => {
      e.preventDefault()
      this.update({ isShow: false })
      this.opts.change(null, this.isShow)
    }

    this.confirm = (e) => {
      e.preventDefault()
      this.update({ isShow: false })
      this.opts.change(this.opts.data[this.activeIndex], this.isShow)
    }
  </script>
</p-select>
