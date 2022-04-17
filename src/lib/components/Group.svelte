<script>
  /** @type {'horizontal'|'vertical'} */
  export let direction = 'horizontal'
</script>

<div class="group {direction}">
  <slot></slot>
</div>

<style>
  .group {
    /* outline: 1px solid red; */
    display: flex;
    margin-bottom: 20px;
  }
  .horizontal {
    flex-direction: row;
    column-gap: 10px;
  }
  .vertical {
    flex-direction: column;
    row-gap: 10px;
  }
</style>