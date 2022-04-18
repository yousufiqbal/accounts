<div class="actions">

  <div class="section">
    <slot class="slot" name="left"></slot>
  </div>

  <div class="section">
    <slot class="slot" name="right"></slot>
  </div>

</div>

<style>
  .actions {
    /* outline: 1px solid red; */
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
  }
  .section {
    display: flex;
    gap: 10px;
  }
</style>