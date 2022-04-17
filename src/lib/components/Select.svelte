<script>
  import { slide } from 'svelte/transition'
  import { kebabCase, startCase } from "lodash-es";
  import RemixIcon from './RemixIcon.svelte';

  export let items = []
  export let value = kebabCase(items[0])

  let show = false
  /** @type {Element} */
  let options

  const showOptions = () => {
    if (show) { show = false; return }
    show = true
    setTimeout(() => {
      options.childNodes[items.indexOf(value)].focus()
    }, 0);
  }

  const handle = e => {
    if (e.key == 'ArrowDown') {
      e.preventDefault()
      let el = e.target.nextElementSibling
      if (el) el.focus()
      return
    }
    if (e.key == 'ArrowUp') {
      e.preventDefault()
      let el = e.target.previousElementSibling
      if (el) el.focus()
    }
    if (e.key == 'Enter') {
      selectOption(e)
    }
  }

  const selectOption = e => {
    value = e.target.name
    show = false
  }
</script>

{#if items.length != 0}
<div class="select {$$props.class}">
  
  <button on:click={showOptions} class="selected">
    <span>{startCase(value)}</span>
    <RemixIcon icon="{show ? 'ri-arrow-up-s-line' : 'ri-arrow-down-s-line'}" />
  </button>
  
  {#if show}
  <div bind:this={options} transition:slide|local={{duration: 100}} class="options">
    {#each items as item}
    <button on:keyup={handle} on:click={selectOption} name="{kebabCase(item)}">{startCase(item)}</button>
    {/each}
  </div>
  {/if}
  
</div>
{/if}

<style>
  .select:hover {
    box-shadow: 0 0 5px 0 rgb(146, 146, 146);
  }
  .select {
    /* width: 200px; */
    display: grid;
    border: var(--border);
  }
  .selected {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: rgb(241, 241, 241);
    padding: var(--padding);
  }
  .options {
    display: grid;
  }
  .options > button {
    padding: var(--padding);
    border-bottom: var(--border);
  }
  .options > button:last-child {
    border-bottom: none;
  }
  .options > button:first-child {
    border-top: var(--border);
  }
  .options > button:hover, .options > button:focus {
    /* color: red; */
    background-color: rgb(233, 244, 255);
  }
</style>