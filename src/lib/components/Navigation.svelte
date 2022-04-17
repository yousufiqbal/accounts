<script>
  import { kebabCase, startCase } from 'lodash-es'
  
  export let items = [], baseUrl = '/'
</script>

<nav class="navigation {$$props.class}">
  {#each items as item}
  <a href="{baseUrl}/{kebabCase(item)}">{startCase(item)}</a>
  {/each}
</nav>

<style>
  .navigation {
    display: flex;
    /* align-items: flex-start; */
  }
  .navigation > * {
    border: var(--border);
    padding: var(--padding);
    border-left: none;
  }
  .navigation > a:first-child {
    border-left: var(--border);
  }
</style>