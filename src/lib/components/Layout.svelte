<div class="layout">
  <div></div>
  <div>
    <slot></slot>
  </div>
</div>

<style>
  .layout {
    display: grid;
    grid-template-columns: 200px 1fr;
    gap: 20px;
  }
</style>