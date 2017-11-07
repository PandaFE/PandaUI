import riot from 'riot'

export default (messages = {}) => {
  const mixins = {
    getMessage (id) {
      return id ? (messages[id] || id) : '--'
    }
  }
  riot.mixin('intl', mixins)
}
