<carousel>
  <p-carousel claxx="list__ul" itemclaxx="list__item" item={ item } carousel={ carousel }>
    <p>{title}</p>
    <p>{desc}</p>
    <p></p>
  </p-carousel>
  <style>
    .list__ul {

    }

    .list__item {
      width: 96px;
      margin-right: 6px;
      text-align: center;
    }
  </style>

  <script>
    import '@/carousel'
    this.carousel = {
      itemWidth: 96,
      itemMarginr: 6,
      speed: 3000,
      duration: 3000
    }
    this.item = [{
      title: '111',
      desc: 'aaaa',
      img: ''
    }, {
      title: '222',
      desc: 'bbbb',
      img: ''
    }, {
      title: '333',
      desc: 'cccc',
      img: ''
    }, {
      title: '444',
      desc: 'dddd',
      img: ''
    }]
  </script>
</carousel>
