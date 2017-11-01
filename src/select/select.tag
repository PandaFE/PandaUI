<p-select>
  <div class="select-component">
    <div class="select-component-labal" click={ toggle }>
      <yield from="select" />
    </div>
    <ul class="select-component-option-wrap" if={ isShow }>
      <li class="select-component-option" each={ item in opts.data} click={ change.bind(null, item) }>
        <yield from="option" />
      </li>
    </ul>
  </div>
  <script>
    import './select.scss'

    this.isShow = false
    this.change = (item) => {
      this.update({ isShow: !this.isShow })
      this.opts.change(item, this.isShow)
    }

    this.toggle = () => {
      this.update({ isShow: !this.isShow })
      this.opts.change(null, this.isShow)
    }
  </script>
</p-select>
