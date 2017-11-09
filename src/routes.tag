<routes>
  <router>
    <route path="/"><sample /></route>
    <route path="/carousel"><page-carousel /></route>
    <route path="/form"><page-form /></route>
    <route path="/select"><page-select /></route>
    <route path="/intl"><page-intl/ ></route>
    <route path="/input"><page-input/ ></route>
    <route path="/toggle"><page-toggle/ ></route>
    <route path="/button"><page-button/ ></route>
    <route path="/dialog"><page-dialog/ ></route>
    <route path="*"><not-found /></route>
  </router>

  <script>
    import './pages/sample'
    import './pages/select'
    import './pages/carousel'
    import './pages/form'
    import './pages/intl'
    import './pages/input'
    import './pages/toggle'
    import './pages/button'
    import './pages/dialog'
    import './pages/notfound'
  </script>
</routes>
