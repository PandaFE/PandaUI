<page-form-elements class="sample-page">
  <virtual ref="form" data-is="p-form" elements={elements}></virtual>
  <p-button onclick={submit}>提交</p-button>

  <script>
    import '@/form'
    import '@/button'

    this.elements = [{
      type: 'input',
      name: 'input',
      label: '输入框',
      default: '默认值'
    }, {
      type: 'select',
      name: 'select',
      label: '选择框',
      options: [1, 2, 3],
      default: 3,
      float: true
    }, {
      type: 'checkbox',
      name: 'checkbox',
      label: '复选框',
      options: [{
        label: '选项1',
        value: 1,
        checked: true
      }, {
        label: '选项2',
        value: 2
      }, {
        label: '选项3',
        value: 3,
        checked: true
      }]
    }]

    setTimeout(() => {
      this.elements[0].default = 'jojo'
      this.update()
    }, 2000)

    this.submit = () => {
      console.log(this.refs.form.getValue())
    }
  </script>
</page-form-elements>
