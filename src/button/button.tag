<p-button class="button-tag">
  <button class="button {opts.className} {opts.type} {disabled: opts.disabled}" onclick={onclick}><yield /></button>

  <script>
    import './button.scss'

    this.extend(this.opts, this.opts.config)

    const {
      onClick = () => {}
    } = this.opts

    this.onclick = () => onClick()
  </script>
</p-button>
