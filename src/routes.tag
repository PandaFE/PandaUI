<routes>
  <router>
    <route path="/"><sample /></route>
    <route path="/carousel"><carousel-sample /></route>
    <route path="/form"><p-form /></route>
    <route path="/select"><page-select /></route>
    <route path="*"><not-found /></route>
  </router>

  <script>
    import './pages/sample'
    import './pages/selectpage'
    import './pages/notfound'
    import './pages/carousel'
    import './pages/form'
  </script>
</routes>
