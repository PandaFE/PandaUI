<p-form>
  <form>
    <form-element each={el in opts.elements} config={el} no-reorder></form-element>
  </form>
  <script>
    import './element'
  </script>
</p-form>
