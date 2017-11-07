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
  : ['mousedown', 'mousemove', 'mouseup', 'mouseout']

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
      loop: false,
      start () {},
      move () {},
      end () {}
    }, options)
    this.target = options.target
    this.initialTouchPos = null
    this.lastTouchPos = null
    this.currentStopPos = 0
    this.lastStopPos = 0
    this.RAFPending = false
    this._handleGestureStart = this._handleGestureStart.bind(this)
    this._handleGestureMove = this._handleGestureMove.bind(this)
    this._handleGestureEnd = this._handleGestureEnd.bind(this)
    this._handleTransitionEnd = this._handleTransitionEnd.bind(this)
    return true
  }

  _init (options) {
    if (this._default(options)) {
      if (options.loop && options.loop.start) {
        this.move(options.loop.start)
      }
      this.target.addEventListener(gestureEvents[0], this._handleGestureStart, eventOpts)
      this.target.addEventListener('webkitTransitionEnd', this._handleTransitionEnd)
    }
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

  _checkLoopBounday (offset, withBoundry) {
    let reset = false
    const loop = this.options.loop
    if (loop) {
      const { max, min, start, end } = loop
      if (offset < min || (withBoundry ? (offset === min) : false)) {
        reset = true
        offset = start
        this.lastStopPos = offset + this.lastStopPos - min
      }
      if (offset > max || (withBoundry ? (offset === max) : false)) {
        reset = true
        offset = end
        this.lastStopPos = offset + this.lastStopPos - max
      }
    }
    return { offset, reset }
  }

  _onAnimFrame (offset, cb) {
    if (!this.RAFPending) {
      return
    }

    requestAnimationFrame(() => {
      let { offset: stopPos } = this._checkLoopBounday(this.lastStopPos + offset)
      this.target.style.transform = `translate3d(${stopPos}px, 0, 0)`
      this.currentStopPos = stopPos
      this.RAFPending = false
      this.options.move(stopPos)
      cb && cb()
    })
  }

  _handleTransitionEnd () {
    let { offset, reset } = this._checkLoopBounday(this.lastStopPos, true)
    if (reset) {
      this.target.style.transition = 'none'
      this.target.style.transform = `translate3d(${offset}px, 0, 0)`
      this.lastStopPos = offset
    }
    // this.move(0)
  }

  _handleGestureStart (evt) {
    if (!isSupportPassive) {
      evt.preventDefault()
    }
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
    this._onAnimFrame(this.lastTouchPos.x - this.initialTouchPos.x)
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
}

export default Swipe
