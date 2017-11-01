<sample>
  <div class="sample__page">
    <div class="page__brief">
      <img src='/img/logo.png' alt="熊猫UILOGO">
      <p class="slogan">熊猫UI,专注UI5000年</p>
    </div>

    <ul class="component__list">
      <li class="component__link" each={ list }>
        <a href={ route || '/' }>
          <span class={'icon icon-' + (icon || 'box')}></span>
          { title }
          <span class="component__subtitle">{ subtitle }</span>
        </a>
      </li>
    </ul>
  </div>

  <script>
    import './sample.scss'

    this.list = [{
      icon: 'image',
      title: '轮播',
      subtitle: '转起来像风车一样好看',
      route: '/carousel'
    }, {
      title: '按钮',
      subtitle: '点击一下，buling buling的',
      route: '/button'
    }, {
      title: '选项卡',
      subtitle: '选哪个都好使',
      route: 'tab'
    }, {
      icon: 'toggle-left',
      title: '表单组件',
      subtitle: '输入从未如此性感',
      route: 'form'
    }, {
      icon: 'cast',
      title: '对话框',
      subtitle: '叮咚',
      route: 'dialog'
    }, {
      icon: 'message-square',
      title: '消息提示',
      subtitle: 'beebeebee',
      route: 'alert'
    }, {
      title: '滚动视窗',
      route: 'scroll'
    }]
  </script>
</sample>
