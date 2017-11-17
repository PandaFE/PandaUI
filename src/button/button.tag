<p-button class="button {opts.className} {opts.type}">
  <button class="btn" onclick={onclick}><yield /></button>

  <script>
    import './button.scss'

    this.extend(this.opts, this.opts.config)

    const {
      onClick = () => {}
    } = this.opts

    this.onclick = () => onClick()
  </script>
</p-button>
