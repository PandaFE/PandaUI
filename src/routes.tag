<routes>
  <router>
    <route path="/"><sample /></route>
    <route path="/carousel"><carousel /></route>
    <route path="/form"><p-form /></route>
    <route path="*"><not-found /></route>
  </router>

  <script>
    import './pages/sample'
    import './pages/notfound'
    import './pages/carousel'
    import './pages/form'
  </script>
</routes>
