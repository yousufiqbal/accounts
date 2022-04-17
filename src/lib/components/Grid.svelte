<script>
  export let columns = '1fr', gap = '20px', size = '600px'
</script>

<div class="grid" style:max-width={size} style:grid-template-columns={columns} style:gap >
  <slot></slot>
</div>

<style>
  .grid {
    /* outline: 1px solid red; */
    display: grid;
    margin-bottom: 40px;
  }
</style>