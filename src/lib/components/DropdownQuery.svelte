<script>
  import { fly } from 'svelte/transition'
  import { page as pg } from "$app/stores";
  import { kebabCase, startCase } from "lodash-es";

  let el = null, show = false
  export let options = [], baseUrl = '', name = 'sort'
  $: selected = startCase($pg.url.searchParams.get(name)) || startCase(options[0])

  // Pagination Support
  $: page = $pg.url.searchParams.get('page') || ''

  const view = () => show = true
  const hide = () => show = false
</script>

<div on:mouseleave={hide} on:mouseenter={view} class="dropdown-query {$$props.class}">

  <button class="selected">
    <span>{selected}</span>
    <i class="ri-arrow-drop-down-line"></i>
  </button>

  {#if show}
  <div transition:fly={{y: -20, duration: 100}} bind:this={el} class="options">

    {#each options as option}
    <a on:click={hide} href="{baseUrl}?{page ? 'page=' + page + '&' : ''}{name}={kebabCase(option)}">{startCase(option)}</a>
    {/each}

  </div>
  {/if}

</div>

<style global>
  .dropdown-query {
    display: grid;
    /* outline: 1px solid red; */
    width: 200px;
    position: relative;
  }
  .dropdown-query .selected {
    /* outline: 1px solid red; */
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: var(--padding);
    border: var(--border);
  }
  .dropdown-query .options > *:hover, .dropdown-query .selected:hover {
    color: red;
    background-color: rgb(248, 248, 248);
  }
  .dropdown-query .selected > i {
    font-size: 1.5rem;
    color: gray;
  }
  .dropdown-query .options {
    background-color: #fff;
    position: absolute;
    z-index: 10;
    top: 38px;
    width: 100%;
    display: grid;
  }
  .dropdown-query .options > * {
    padding: var(--padding);
    border: var(--border);
    border-top: none;
  }
</style>