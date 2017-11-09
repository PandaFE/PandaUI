<p-button class="button">
  <button class="btn {opts.type}"><yield /></button>

  <script>
    import './button.scss'

    this.extend(this.opts, this.opts.config)
  </script>
</p-button>
