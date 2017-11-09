<page-form>
  <div class="sample__page">
    <ul class="component__list">
      <li class="component__link" each={ list }>
        <a class="color-black" href={ route || '/' }>
          <span class={'icon icon-' + (icon || 'box')}></span>
          { title }
          <span class="component__subtitle color-grey font-sm">{ subtitle }</span>
        </a>
      </li>
    </ul>
  </div>

  <script>
    import '@/form'

    this.list = [{
      title: '输入框',
      route: '/input'
    }, {
      title: 'Toggle',
      route: '/toggle'
    }, {
      title: '选择器',
      route: '/select'
    }, {
      title: '滑动取值器',
      subtitle: '德芙般丝滑',
      route: '/slider'
    }, {
      title: '进度条',
      route: '/progress'
    }, {
      title: '表单元素块',
      route: '/formelement'
    }]
  </script>
</page-form>
