<app>
  <div id="scroll">
    <virtual data-is="routes"></virtual>
  </div>

  <script>
    import './theme/default.scss'
    import './routes'
    import provideIntlMessages from './intl'
    import enUS from './lang/en-US.json'

    provideIntlMessages(enUS)
  </script>
</app>
