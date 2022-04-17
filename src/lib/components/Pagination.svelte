<script>
  import { page as pg } from '$app/stores'
  import { getOtherQueryParams } from '$lib/others/utils';

  export let totalRows = 0
  export let limit = 20
  export let otherParams = false
  
  $: page = +$pg.url.searchParams.get('page') || 1
  $: totalPages = Math.ceil(totalRows/limit)
  $: prevPage = page == 1 ? 1 : page - 1
  $: nextPage = page < totalPages ? page + 1 : totalPages
  $: queryParams = otherParams && getOtherQueryParams($pg, 'page')
</script>

{#if totalPages >= 2}
<div class="pagination {$$props.class}">
  <a href="?page={prevPage}{queryParams}">Prev</a>
  <div class="status">{page} of {totalPages}</div>
  <a href="?page={nextPage}{queryParams}">Next</a>
</div>
{/if}

<style>
  .pagination {
    /* outline: 1px solid red; */
    display: flex;
  }
  .pagination > * {
    padding: var(--padding);
    border: var(--border);
    border-left: none;
  }
  .pagination > :first-child {
    border-left: var(--border);
  }
  .status {
    text-align: center;
    width: 90px;
  }
</style>