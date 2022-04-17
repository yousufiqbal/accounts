<script>
  import { page } from "$app/stores";

  // 'brands': '/brands',
  
  import { startCase } from "lodash-es";
  export let crumbs = null
</script>

{#if crumbs}
<div class="breadcrumb {$$props.class}">
  
  {#each Object.keys(crumbs) as item, index}

    {#if $page.url.pathname == crumbs[item]}
    <div>{startCase(item)}</div>
    {:else}
    <a href="{crumbs[item]}">{startCase(item)}</a>
    {/if}
    
    {#if index + 1 < Object.keys(crumbs).length}
    <span>&rarr;</span>
    {/if}
  
  {/each}

</div>
{/if}

<style>
  div, a {
    text-transform: capitalize;
  }
  a:hover {
    border-bottom: 1px solid blue;
    display: inline-block; /*Add this*/
    /* text-decoration: underline; */
  }
  .breadcrumb {
    /* outline: 1px solid red; */
    display: flex;
    align-items: flex-start;
    column-gap: 15px;
  }
  a {
    padding-bottom: 2px;
    border-bottom: 1px solid #fff;
    color: blue;
  }
</style>