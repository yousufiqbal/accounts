<script>
  import { page } from "$app/stores";

  export let baseUrl = '/'
  export let items = []
  export let name = 'tab'

  $: current = $page.url.searchParams.get(name) || 'all'
</script>

<div class="tabs">
  <a class:active={current=='all'} href="{baseUrl}?{name}=all">All</a>
  {#each items as item}
  <a class:active={current==item} href="{baseUrl}?{name}={item}">{item}</a>
  {/each}
</div>

<style>
  .tabs {
    display: flex;
    margin-bottom: 30px;
    border-left: var(--border);
  }
  a {
    color: blue;
    padding: var(--padding);
    border: var(--border);
    border-left: none;
    text-transform: capitalize;
  }
  a:hover {
    color: red
  }
  a.active {
    color: red;
  }
</style>