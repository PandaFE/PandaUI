<page-select>
  <div class="select">
    <p-select data={pcData} change={pcChangeSelect} type="pc">
      <yield to="select">
        {parent.pcSelectValue}
        <img class="select-icon" src={parent.pcSelectIcon} alt="">
      </yield>
      <yield to="option">
        <span>{item.name}</span>
      </yield>
    </p-select>
    <hr />
    <p-select data={data} change={changeSelect}>
      <yield to="select">
        {parent.selectValue}
        <img class="select-icon" src={parent.selectIcon} alt="">
      </yield>
      <yield to="option">
        <span>{item.name}</span>
      </yield>
    </p-select>
  </div>
  <script>
    import '@/select'
    import './select.scss'

    // PC
    this.pcSelectIcon = '/img/open.png'
    this.pcSelectValue = 'pc__select'
    this.pcData = [{name: 'pc__aaa', id: 1}, {name: 'pc__bbb', id: 2}, {name: 'pc__ccc', id: 3}, {name: 'pc__ddd', id: 4}, {name: 'pc__eee', id: 5}]
    this.pcChangeSelect = (item, isShow) => {
      item && this.update({ pcSelectValue: item.name })
      this.update({ pcSelectIcon: isShow ? '/img/close.png' : '/img/open.png' })
      console.log(item)
    }

    // APP
    this.selectIcon = '/img/open.png'
    this.selectValue = 'app__select'
    this.data = [{name: 'app__aaa', id: 1}, {name: 'app__bbb', id: 2}, {name: 'app__ccc', id: 3}, {name: 'app__ddd', id: 4}, {name: 'app__eee', id: 5}]
    this.changeSelect = (item, isShow) => {
      item && this.update({ selectValue: item.name })
      this.update({ selectIcon: isShow ? '/img/close.png' : '/img/open.png' })
      console.log(item)
    }
  </script>
</page-select>
