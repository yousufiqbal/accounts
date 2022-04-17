<script>
import { afterNavigate } from '$app/navigation';

  import { page as pg } from '$app/stores'
  import RemixIcon from '$lib/components/RemixIcon.svelte';
  import { getOtherQueryParams } from './utils';

  afterNavigate(() => {
    if (autoScroll == false) return
    if (document.documentElement.scrollTop == 0) return
    window.scrollTo({ top: 0, behavior: 'smooth' });
  })

  export let autoScroll = true
  export let totalRows = 0
  export let limit = 20 // limit not changable from inside
  export let opts = { start: false }

  $: page = +$pg.url.searchParams.get('page') || 1
  $: totalPages = Math.ceil(totalRows/limit)
  $: prevPage = page == 1 ? 1 : page - 1
  $: nextPage = page < totalPages ? page + 1 : totalPages
  
  export let keepParams = []
  $: otherParams = getOtherQueryParams(keepParams, $pg, opts)
</script>

{#if totalPages >= 2}
<div class="wrapper">
  <div class="pagination {$$props.class}">

    <!-- {#if page != 1} -->
    <a sveltekit:noscroll class="icon" href="?page={prevPage}{otherParams}">
      <RemixIcon icon="ri-arrow-left-line" size="1.2rem" />
      <!-- <span>Prev</span> -->
    </a>
    <!-- {/if} -->
  
    <div class="status">Page <strong>{page}</strong> of {totalPages}</div>
  
    <a sveltekit:noscroll class="icon next" href="?page={nextPage}{otherParams}">
      <!-- <span>Next</span> -->
      <RemixIcon icon="ri-arrow-right-line" size="1.2rem" />
    </a>
  
  </div>
</div>
{/if}

<style>
  strong {
    font-weight: bold;
    /* color: red; */
  }
  .next {
    background-color: #0080FF;
    color: white;
    font-family: 'Bree Serif';
  }
  a {
    color: blue;
    background-color: rgb(248, 248, 248);
  }
  .pagination {
    /* outline: 1px solid red; */
    display: flex;
    /* box-shadow: 0 0 5px 0 rgb(153, 153, 153); */
  }
  .pagination > * {
    padding: 7px 15px;
    border: var(--border);
    border-left: none;
  }
  .pagination > :first-child {
    border-left: var(--border);
  }
  .status {
    white-space: nowrap;
    /* flex: 1; */
    text-align: center;
    /* width: 90px; */
  }
</style>