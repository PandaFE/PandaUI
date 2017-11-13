import riot from 'riot'

class Dialog {
  constructor (...rest) {
    this.id = this.createMountPoint()
    this.tag = riot.mount(`#${this.id}`, ...rest)[0]
    return this
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

export default Dialog
