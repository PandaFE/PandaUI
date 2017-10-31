<sample>
  <div class="sample__page">
    <div class="page__brief">
      <img src='/img/logo.png' alt="熊猫UILOGO">
      <p class="slogan">熊猫UI,专注UI5000年</p>
    </div>

    <span class="font-md color-grey">组件列表</span>
    <ul class="component__list">
      <li class="component__link" each={ list }>
        <a href={ route }> { title } <span class="component__subtitle">{ subtitle }</span></a>
      </li>
    </ul>
  </div>

  <script>
    import './sample.scss'

    this.list = [{
      title: '轮播',
      subtitle: '转起来像风车一样好看',
      route: '/carousel'
    }, {
      title: '下拉选择器',
      subtitle: '选我呢还是选我呢',
      route: '/select'
    }]
  </script>
</sample>
