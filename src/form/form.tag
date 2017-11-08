<p-form>
  <form>
    <element each={el in opts.elements} config={el} no-reorder></element>
  </form>
  <script>
    import './element'
  </script>
</p-form>
