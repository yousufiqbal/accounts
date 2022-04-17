<div class="field-group {$$props.class}">
  <slot></slot>
</div>

<style>
  .field-group {
    /* outline: 1px solid red; */
    /* grid-template-columns: repeat(var(--repeat, 2), 1fr); */
    max-width: 500px;;
    display: grid;
    gap: 20px
  }
</style>