<script>
  import { page } from "$app/stores";

  const Crumb = [ { name: '', href: '' } ]

  /** @type {Crumb} */
  export let crumbs = []
</script>

{#if crumbs.length != 0}
<div class="breadcrumb">

  {#each crumbs as crumb, index}

    {#if crumb.href != $page.url.pathname}
      <a href="{crumb.href}">{crumb.name}</a>
    {:else}
      <span>{crumb.name}</span>
    {/if}

    {#if +index + 1 < crumbs.length}
      <span>&rarr;</span>
    {/if}

  {/each}
  
</div>
{/if}

<style>
  .breadcrumb {
    /* outline: 1px solid red; */
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
  }
  a, span {
    text-transform: capitalize;
  }
  a {
    color: blue;
  }
</style>