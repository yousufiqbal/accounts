<script>
  import { capitalize } from "$lib/others/utils";

  /** @type {string} */
  export let title, below = '', description = title
</script>

<div class="title">
  <h1>{title}</h1>
  {#if below}
  <div>{below}</div>
  {/if}
</div>

<svelte:head>
  <title>Accounts - {capitalize(title)}</title>
  <meta name="description" content="{description}">
</svelte:head>

<style>
  .title {
    /* outline: 1px solid red; */
    margin-bottom: 20px;
  }
  h1 {
    text-transform: capitalize;
    font-weight: bold;
    font-size: 1.3rem;
    letter-spacing: 0.5px;
  }
</style>