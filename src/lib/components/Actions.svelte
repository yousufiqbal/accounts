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
    display: flex;
    justify-content: space-between;
    outline: 1px solid red;
    margin-bottom: 20px;
  }
  .section {
    display: flex;
    gap: 10px;
  }
</style>