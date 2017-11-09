import riot from 'riot'

class Dialog {
  constructor (...reset) {
    this.id = this.createMountPoint()
    this.tag = riot.mount(`#${this.id}`, ...reset)[0]
    return this
  }

  createMountPoint () {
    const id = `_${Math.random().toString(32).slice(2)}`
    let div = document.createElement('div')
    div.id = id
    document.body.appendChild(div)
    return id
  }

  update (...reset) {
    if (this.tag) {
      this.tag.update(...reset)
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
