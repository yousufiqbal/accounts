<script>
  export let rating = 0
  export let total = 0
</script>

<div class="rating">
  <i class="ri-star-fill ri-sm"></i>
  <span>{rating}</span>
  {#if total}
  <span>({total})</span>
  {/if}
</div>

<style>
  .rating {
    /* outline: 1px solid red; */
    display: inline-flex;
    align-items: center;
    column-gap: 5px;
  }
  i {
    color: rgb(255, 166, 0);;
  }
  span {
    color: gray;
  }
</style>