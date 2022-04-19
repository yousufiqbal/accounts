<script>
  import { capitalize } from "$lib/others/utils";
  import Icon from "./Icon.svelte";
  import { fly } from 'svelte/transition'

  /** @type {string} */
  export let title, below = '', description = title
  export let back = false
</script>

<div class="title">
  {#if back}
  <button on:click={()=>history.go(-1)}>
    <Icon size="2rem" icon="back" />
  </button>
  {/if}
  <div in:fly={{x: -20, duration: 200}}>
    <h1>{title}</h1>
    {#if below}<div>{below}</div>{/if}
  </div>
</div>

<svelte:head>
  <title>Accounts - {capitalize(title)}</title>
  <meta name="description" content="{description}">
</svelte:head>

<style>
  button {
    display: flex;
    /* color: blue; */
  }
  button:hover {
    color: blue;
  }
  .title {
    display: flex;
    align-items: start;
    gap: 8px;
    margin-bottom: 20px;
  }
  h1 {
    text-transform: capitalize;
    font-weight: bold;
    font-size: 1.3rem;
    letter-spacing: 0.5px;
  }
</style>