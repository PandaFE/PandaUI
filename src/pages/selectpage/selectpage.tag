<page-select>
  <div class="select">
    <p-select data={data} change={changeSelect}>
      <yield to="select">
        <span>{parent.selectValue}</span>
        <img src={parent.selectIcon} alt="">
      </yield>
      <yield to="option">
        <span>{item.name}</span>
      </yield>
    </p-select>
  </div>
  <script>
    import '@/select'
    import './selectpage.scss'
    this.selectValue = 'xxxsxs'
    this.selectIcon = '/img/open.png'
    this.data = [{name: 'aaa', id: 1}, {name: 'bbb', id: 2}, {name: 'ccc', id: 3}]
    this.changeSelect = (item, isShow) => {
      item && this.update({ selectValue: item.name })
      this.update({ selectIcon: isShow ? '/img/close.png' : '/img/open.png' })
    }
  </script>
</page-select>
