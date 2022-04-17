<script>
  import { kebabCase, startCase } from "lodash-es";
  // import RemixIcon from "$lib/components/RemixIcon.svelte";

  export let items = []
  export let baseUrl = ''
</script>

{#if items.length != 0}
<div class="simple-menu {$$props.class}">
  
  {#each items as item}
  <a class="icon" href="{baseUrl}/{kebabCase(item)}">
    <!-- <RemixIcon icon="ri-menu-line" /> -->
    <span>{startCase(item)}</span>
  </a>
  {/each}

  <slot></slot>

</div>
{/if}

<style global>
  .simple-menu {
    /* outline: 1px solid red; */
    margin: 60px 0 0 0;
    display: grid;
  }
  .simple-menu > :hover {
    color: red;
  }
  .simple-menu > * {
    padding: var(--padding);
    border-bottom: var(--border);
  }
</style>