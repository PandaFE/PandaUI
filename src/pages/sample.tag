<sample>
  <div class="sample__page">
    <img src='/img/logo.png' alt="">

    <ul>
      <li each={ list }>
        <a href={ route }> { label } </a>
      </li>
    </ul>
  </div>

  <script>
    import './sample/sample.scss'

    this.list = [{
      label: '轮播',
      route: '/carousel'
    }, {
      label: '下拉选择器',
      route: '/select'
    }]
  </script>
</sample>
