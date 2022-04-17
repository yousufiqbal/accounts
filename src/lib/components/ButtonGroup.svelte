<script>
  export let type = 'horizontal'
</script>

<div class="button-group {type} {$$props.class}">
  <slot></slot>
</div>

<style>
  .button-group {
    display: flex;
    gap: 15px;
    justify-content: var(--justify-content, start);
    flex-wrap: wrap;
  }
  .vertical {
    flex-direction: column;
    align-items: start;
  }
</style>