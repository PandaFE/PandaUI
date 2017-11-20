<default-custom-dialog-selector>
  <dialog-template show={show} position="center" class-name="selector">
    <yield to="body">
      <div class="row padding-v-lg">
        <div
          each={option, index in parent.opts.options}
          class="column col-{12 / parent.parent.opts.options.length}"
          key={index}
        >
          <!--options 选项冲突-->
          <scroll-list
            options={option}
            on-change={parent.parent.onChange.bind(parent.parent, index)}
          ></scroll-list>
        </div>
      </div>
    </yield>
    <yield to="footer">
      <p-button onclick={parent.confirm}>OK</p-button>
    </yield>
  </dialog-template>

  <script>
    import '@/dialog/dialog-template'
    import '@/button'
    import '@/scrolllist'

    const {
      show,
      select = () => {}
    } = this.opts

    this.show = show

    let values = []

    this.onChange = (index, value) => {
      values[index] = value
    }

    this.confirm = () => {
      select(values)
    }
  </script>
</default-custom-dialog-selector>
