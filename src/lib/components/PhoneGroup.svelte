<div class="phone-group {$$props.class}">
  <slot></slot>
</div>

<style>
  .phone-group {
    max-width: 800px;
    display: flex;
    column-gap: 15px;
    row-gap: 25px;
    flex-wrap: wrap;
    /* justify-content: start; */
    /* margin-bottom: 50px; */
  }
</style>