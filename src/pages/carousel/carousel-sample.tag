<carousel-sample>
  <carousel item={ item } carousel={ carousel }>
    <img src={ img } alt="">
  </carousel>

  <script>
    import './carousel.scss'
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
</carousel-sample>
