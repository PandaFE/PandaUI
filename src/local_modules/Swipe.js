import extend from 'lodash/extend'

let isSupportPassive = false
;(() => {
  try {
    var opts = Object.defineProperty({}, 'passive', {
      get () {
        isSupportPassive = true
      }
    })
    window.addEventListener('test', null, opts)
  } catch (e) {}
})()
const eventOpts = isSupportPassive ? { passive: true } : false
const gestureEvents = window.TouchEvent
  ? ['touchstart', 'touchmove', 'touchend', 'touchcancel']
  : ['mousedown', 'mousemove', 'mouseup', 'mouseleave']

class Swipe {
  constructor (options) {
    this._init(options)
  }

  _default (options = {}) {
    if (!options.target || !(options.target instanceof Element)) {
      console.error('options "target" is required as a DOM Node')
      return false
    }

    this.options = extend({
      target: null, // required, must be overwirtten
      axis: 'x',
      loop: false, // 若loop为true 下面四项为必填
      begin: 0,
      stop: 0,
      max: 0,
      min: 0,
      start () {},
      move () {},
      end () {}
    }, options)

    this.target = options.target
    this.initialTouchPos = null // 每次滑动起始位置
    this.lastTouchPos = null // 滑动停下的位置
    this.currentStopPos = 0 // 滑动中更新的点
    this.lastStopPos = 0 // 上次停下的点
    this.RAFPending = false // requestAnimationFrame 进程标识量
    this.ruleAttr = this.options.axis === 'x' ? 'clientWidth' : 'clientHeight' // 参考单位

    /*
    this.shapeExist = false
    this.restrictDistance = 0 // 滑动限制距离
    this.swipeDistance = 0 // 可滑动总距离
    */

    this._handleGestureStart = this._handleGestureStart.bind(this)
    this._handleGestureMove = this._handleGestureMove.bind(this)
    this._handleGestureEnd = this._handleGestureEnd.bind(this)
    this._handleTransitionEnd = this._handleTransitionEnd.bind(this)

    return true
  }

  _init (options) {
    if (this._default(options)) {
      this.move(options.begin)
      this.target.addEventListener(gestureEvents[0], this._handleGestureStart, eventOpts)
      this.target.addEventListener('webkitTransitionEnd', this._handleTransitionEnd)
    }
  }

  _getSwipeShape () {
    if (this.shapeExist) {
      return
    }
    this.shapeExist = true
    this.restrictDistance = this.target.parentElement[this.ruleAttr]
    this.swipeDistance = this.target[this.ruleAttr]
  }

  _getGesturePointFromEvent (evt) {
    if (evt.targetTouches) {
      return {
        x: evt.targetTouches[0].clientX,
        y: evt.targetTouches[0].clientY
      }
    }
    return {
      x: evt.clientX,
      y: evt.clientY
    }
  }

  _checkBoundry (...rest) {
    const { min, max, loop } = this.options
    if (loop) {
      return this._checkLoopBounday(...rest)
    } else {
      let offset = rest[0]
      if (offset > max) {
        offset = max
      }
      if (offset < min) {
        offset = min
      }
      return {
        offset
      }
    }
  }

  _checkLoopBounday (offset, withBoundry) {
    let reset = false
    const { max, min, begin, stop } = this.options
    if (offset < min || (withBoundry ? (offset === min) : false)) {
      reset = true
      offset = begin
      this.lastStopPos = offset + this.lastStopPos - min
    }
    if (offset > max || (withBoundry ? (offset === max) : false)) {
      reset = true
      offset = stop
      this.lastStopPos = offset + this.lastStopPos - max
    }
    return { offset, reset }
  }

  _getStyleExpression (offset) {
    return this.options.axis === 'x' ? `translate3d(${offset}px, 0, 0)` : `translate3d(0, ${offset}px, 0)`
  }

  _onAnimFrame (offset, cb) {
    if (!this.RAFPending) {
      return
    }

    requestAnimationFrame(() => {
      let { offset: stopPos } = this._checkBoundry(this.lastStopPos + offset)
      this.target.style.transform = this._getStyleExpression(stopPos)
      this.currentStopPos = stopPos
      this.RAFPending = false
      this.options.move(stopPos)
      cb && cb()
    })
  }

  _handleTransitionEnd () {
    let { offset, reset } = this._checkBoundry(this.lastStopPos, true)
    if (reset) {
      this.target.style.transition = 'none'
      this.target.style.transform = this._getStyleExpression(offset)
      this.lastStopPos = offset
    }
    // this.move(0)
  }

  _handleGestureStart (evt) {
    if (!isSupportPassive) {
      evt.preventDefault()
    }
    // this._getSwipeShape()
    this.options.start()

    this.target.addEventListener(gestureEvents[1], this._handleGestureMove, eventOpts)
    this.target.addEventListener(gestureEvents[2], this._handleGestureEnd, eventOpts)
    this.target.addEventListener(gestureEvents[3], this._handleGestureEnd, eventOpts)

    this.initialTouchPos = this._getGesturePointFromEvent(evt)
    this.target.style.transition = 'none'
  }

  _handleGestureMove (evt) {
    if (!isSupportPassive) {
      evt.preventDefault()
    }
    if (!this.initialTouchPos || this.RAFPending) {
      return
    }
    this.RAFPending = true
    this.lastTouchPos = this._getGesturePointFromEvent(evt)
    const axis = this.options.axis
    this._onAnimFrame(this.lastTouchPos[axis] - this.initialTouchPos[axis])
  }

  _handleGestureEnd (evt) {
    this.target.removeEventListener(gestureEvents[1], this._handleGestureMove, eventOpts)
    this.target.removeEventListener(gestureEvents[2], this._handleGestureEnd, eventOpts)
    this.target.removeEventListener(gestureEvents[3], this._handleGestureEnd, eventOpts)

    this.RAFPending = false
    this.initialTouchPos = null
    // !!!
    if (this.options.end(this.lastStopPos, this.currentStopPos - this.lastStopPos) !== false) {
      this.lastStopPos = this.currentStopPos
    }
  }

  move (position, withAnimation) {
    if (this.RAFPending) {
      return
    }
    if (withAnimation) {
      this.target.style.transition = 'transform 250ms ease-out'
    } else {
      this.target.style.transition = 'none'
    }
    this.RAFPending = true
    this._onAnimFrame(position, () => {
      this.lastStopPos += position
    })
  }

  setOptions (options) {
    extend(this.options, options)
  }
}

export default Swipe
