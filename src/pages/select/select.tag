<page-select class="sample-page">
  <form-element type="select" label="默认选择器(浮动)" options={[1, 2, 3]}></form-element>
  <form-element type="select" label="非浮动式式选项列表" options={[1, 2, 3]} static={true}></form-element>
  <form-element type="select" label="弹窗式选项列表单列滚动" options={[1, 2, 3, 4, 5, 6]} dialog={true}></form-element>
  <form-element
    type="select"
    label="弹窗式选项列表多列滑动"
    options={[[1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6]]}
    dialog={true}
  ></form-element>

  <script>
    import '@/form/element'
    import '@/select'
    import './select.scss'
  </script>
</page-select>
