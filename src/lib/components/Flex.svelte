<script>
  /** @type {'row'|'column'} */
  export let direction = 'row'
  export let gap = '10px'
</script>

<div style:flex-direction={direction} style:gap class="flex">
  <slot></slot>
</div>

<style>
  .flex {
    /* outline: 1px solid red; */
    display: flex;
    margin-bottom: 20px;
  }
</style>