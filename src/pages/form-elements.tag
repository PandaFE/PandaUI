<page-form-elements class="sample-page">
  <virtual ref="form" data-is="p-form" elements={elements} on-change={onChange}></virtual>
  <p-button on-click={submit} disabled={!isValid}>提交</p-button>

  <script>
    import '@/form'
    import '@/button'

    this.elements = [{
      type: 'input',
      name: 'input',
      label: '输入框',
      defaultValue: '默认值',
      required: true
    }, {
      type: 'select',
      name: 'select',
      label: '选择框',
      options: [1, 2, 3],
      float: true,
      required: true
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
      }, '选项4'],
      required: true
    }, {
      name: 'datepicker',
      label: '选择日期',
      type: 'datepicker',
      defaultValue: [1991, 1, 1],
      required: true
    }, {
      label: 'select',
      name: 'select',
      type: 'select',
      options: [{
        label: 'option 1',
        value: 1
      }],
      required: true
    }]

    this.isValid = true

    this.onChange = isValid => {
      this.isValid = isValid
      this.update({
        isValid
      })
    }

    this.submit = () => {
      console.log(this.refs.form.getValue())
    }
  </script>
</page-form-elements>
