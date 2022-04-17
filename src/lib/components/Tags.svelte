<script>
  import { kebabCase, startCase } from "lodash-es";

  export let items = [], baseUrl = '/', first = '', freewidth = false
  export let wrap = false
</script>

{#if items.length != 0}
<div class:wrap class="tags {$$props.class}">
  
  {#if first}
  <a class:freewidth class="first" href="{baseUrl}{kebabCase(first)}">{startCase(first)}</a>
  {/if}

  {#each items as item}
  <a class:freewidth href="{baseUrl}{kebabCase(item)}">{startCase(item)}</a>
  {/each}

</div>
{/if}

<style>
  .wrap {
    flex-wrap: wrap;
  }
  .tags {
    /* outline: 1px solid red; */
    display: flex;
    column-gap: 10px;
    row-gap: 15px;
    overflow-x: auto;
    /* overflow-y: visible; */
    white-space: nowrap;
    padding-bottom: 10px;
  }
  a:hover {
    background-color: green;
    color: white;
    /* box-shadow: 0 0 8px 0 rgb(134, 134, 134); */
  }
  a.freewidth {
    width: auto;
  }
  a {
    width: 100px;
    text-overflow: ellipsis;
    overflow: hidden;
    /* box-shadow: 0 0 4px 0 rgb(179, 179, 179); */
    background-color: rgb(250, 250, 250);
    padding: var(--padding);
    border: var(--border);
    border-radius: 15px;
  }
  .first {
    background-color: rgb(49, 49, 49);
    color: white;
  }
</style>