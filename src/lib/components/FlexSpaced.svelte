<div class="flex-spaced {$$props.class}">
  <slot></slot>
</div>

<style>
  .flex-spaced {
    display: flex;
    justify-content: space-between;
    align-items: var(--align-items, start);
  }
</style>