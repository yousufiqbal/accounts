<script>
  import { startCase } from "lodash-es";
  import RemixIcon from "./RemixIcon.svelte";

  export let items = []

  const removeItem = () => {
    // WIP
  }
</script>

<div class="compare-list {$$props.class}">

  {#each items as item}
  <div class="item">
    <span>{startCase(item)}</span>
    <button on:click={removeItem}>
      <RemixIcon icon="ri-delete-bin-line" size="1.3rem" />
    </button>
  </div>
  {/each}
  
  {#if items.length <= 1}
  <button class="warning">
    <RemixIcon icon="ri-error-warning-line" size="1.3rem" />
    <span>Add {items.length == 0 ? '2 Phones' : '1 More Phone'} to Compare</span>
  </button>
  {/if}

</div>

<style>
  .compare-list {
    /* outline: 1px solid red; */
    display: grid;
  }
  .compare-list > * {
    display: flex;
    justify-content: space-between;
    padding: 8px 15px;
    border: var(--border);
    border-bottom: none;
    color: blue;
  }
  .compare-list > :last-child {
    border-bottom: var(--border);
  }
  .warning {
    color: black;
    padding: 10px;
    border: var(--border);
    display: flex;
    justify-content: center;
    column-gap: 10px;
    background-color: rgb(255, 244, 244);
    /* color: black; */
  }
</style>