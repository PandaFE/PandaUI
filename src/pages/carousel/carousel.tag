<carousel>
  <p-carousel claxx="list__ul" itemclaxx="list__item" item={ item } carousel={ carousel }>
    <p if={ title }>{ title }</p>
    <p if={ desc }>{ desc }</p>
    <img src={ img } alt="">
  </p-carousel>
  <style>
    .list__item {
      width: 113px;
      margin-right: 0;
      text-align: center;
    }
    .list__item img {
      width: 100%;
    }
  </style>

  <script>
    import '@/carousel'
    this.carousel = {
      itemWidth: 113,
      itemHeight: 106,
      itemMarginr: 0,
      speed: 2000,
      duration: 2000
    }
    this.item = [{
      img: 'img/carousel/img_01.png'
    }, {
      img: 'img/carousel/img_02.png'
    }, {
      img: 'img/carousel/img_03.png'
    }, {
      img: 'img/carousel/img_04.png'
    }, {
      img: 'img/carousel/img_05.png'
    }, {
      img: 'img/carousel/img_06.png'
    }]
  </script>
</carousel>
