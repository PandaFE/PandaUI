import riot from 'riot'

class Component {
  constructor (...rest) {
    this.id = this.createMountPoint()
    this.tag = riot.mount(`#${this.id}`, ...this.normalize(...rest))[0]
    return this
  }

  normalize (...rest) {
    let [tagName, options] = rest
    if (typeof tagName !== 'string') {
      options = tagName
      tagName = this.getDefaultTag()
      return [tagName, options]
    } else {
      return rest
    }
  }

  getDefaultTag () {
    return 'default'
  }

  createMountPoint () {
    const id = `_${Math.random().toString(32).slice(2)}`
    let div = document.createElement('div')
    div.id = id
    document.body.appendChild(div)
    return id
  }

  update (...rest) {
    if (this.tag) {
      this.tag.update(...rest)
    }
  }

  show () {
    this.update({
      show: true
    })
  }

  hide () {
    this.update({
      show: false
    })
  }

  destroy () {
    if (this.tag && this.tag.unmount) {
      this.tag.unmount()
    }
  }
}

export default Component
