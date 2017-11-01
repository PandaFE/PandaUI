<p-form>
  <div class="sample__page">
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
    this.list = [{
      title: '输入框',
      route: '/carousel'
    }, {
      title: '单选框',
      route: 'radio'
    }, {
      title: '多选框',
      route: 'checkbox'
    }, {
      title: '下拉选择器',
      route: '/select'
    }, {
      title: '滑动取值器',
      subtitle: '德芙般丝滑',
      route: 'slider'
    }, {
      title: '进度条',
      route: 'progress'
    }]
  </script>
</p-form>
