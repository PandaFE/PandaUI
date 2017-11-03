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
  : ['mousedown', 'mousemove', 'mouseup']

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
    this.initialTouchPos = null
    this.lastTouchPos = null
    this.currentOffset = 0
    this.lastOffset = 0
    this.RAFPending = false
    this._handleGestureStart = this._handleGestureStart.bind(this)
    this._handleGestureMove = this._handleGestureMove.bind(this)
    this._handleGestureEnd = this._handleGestureEnd.bind(this)
    return true
  }

  _init (options) {
    if (this._default(options)) {
      const target = options.target
      if (options.loop && options.loop.start) {
        this.moveTo(options.loop.start)
      }
      target.addEventListener(gestureEvents[0], this._handleGestureStart, eventOpts)
    }
  }

  moveTo (position) {
    if (this.RAFPending) {
      return
    }
    this.RAFPending = true
    this._onAnimFrame(position, () => {
      this.lastOffset = position
    })
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

  _checkLoopBounday (offset) {
    const loop = this.options.loop
    if (loop) {
      const { max, min, start, end } = loop
      if (offset < max) {
        offset = start
        this.lastOffset = offset + this.lastOffset - max
      }
      if (offset > min) {
        offset = end
        this.lastOffset = offset + this.lastOffset - min
      }
    }
    return offset
  }

  _onAnimFrame (offset, cb) {
    if (!this.RAFPending) {
      return
    }

    requestAnimationFrame(() => {
      offset = this._checkLoopBounday(offset)
      this.options.target.style.transform = `translate3d(${offset}px, 0, 0)`
      this.currentOffset = offset
      this.RAFPending = false
      this.options.move(offset)
      cb && cb()
    })
  }

  _handleGestureStart (evt) {
    if (!isSupportPassive) {
      evt.preventDefault()
    }
    const target = this.options.target
    this.options.start()
    target.addEventListener(gestureEvents[1], this._handleGestureMove, eventOpts)
    target.addEventListener(gestureEvents[2], this._handleGestureEnd, eventOpts)
    this.initialTouchPos = this._getGesturePointFromEvent(evt)
    target.style.transition = 'initial'
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
    this._onAnimFrame(this.lastOffset + this.lastTouchPos.x - this.initialTouchPos.x)
  }

  _handleGestureEnd (evt) {
    const target = this.options.target
    this.options.end(this.lastOffset, this.currentOffset - this.lastOffset)
    this.lastOffset = this.currentOffset
    target.removeEventListener(gestureEvents[1], this._handleGestureMove, eventOpts)
    target.removeEventListener(gestureEvents[2], this._handleGestureEnd, eventOpts)
    this.RAFPending = false
    this.initialTouchPos = null
  }
}

export default Swipe
