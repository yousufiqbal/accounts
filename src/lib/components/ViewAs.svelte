<script>
  import { page } from "$app/stores";
  import RemixIcon from "./RemixIcon.svelte";

  export let baseUrl = '/'
  $: view = $page.url.searchParams.get('view') || 'grid'
</script>

<div class="view-as {$$props.class}">
  <a class:active={view=='list'} href="{baseUrl}?view=list" title="List">
    <RemixIcon icon="ri-list-unordered" size="1.3rem" />
  </a>
  <a class:active={view=='grid'} href="{baseUrl}?view=grid" title="Grid">
    <RemixIcon icon="ri-layout-grid-line" size="1.3rem" />
  </a>
</div>

<style>
  .view-as {
    /* outline: 1px solid red; */
    display: flex;
  }
  a {
    display: flex;
    padding: 5px 7px;
    border: var(--border);
    border-right: none;
  }
  a:last-child {
    border-right: var(--border);
  }
  a:hover {
    color: red;
  }
  .active {
    color: red
  }
</style>