<div class="admin-layout">
  <div></div>
  <div>
      <slot></slot>
  </div>
</div>

<style>
  .admin-layout {
    /* outline: 1px solid red; */
    display: grid;
    column-gap: 20px;
    grid-template-columns: 200px 1fr;
  }
</style>