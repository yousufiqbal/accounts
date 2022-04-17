<script>
  import { fly } from 'svelte/transition'
  import RemixIcon from './RemixIcon.svelte'
  import { beforeNavigate } from '$app/navigation'
  import { createEventDispatcher } from 'svelte'

  const dispatch = createEventDispatcher()

  beforeNavigate(() => {
    show = false
  })

  let keyword = '', show = false
  let results
  export let input
  export let placeholder = 'Quick Browse'

  const handleInput = e => {
    if (e.key == 'ArrowUp') {
      e.preventDefault()
      results.lastElementChild?.focus(); return
    }
    if (e.key == 'ArrowDown') {
      e.preventDefault()
      results.firstElementChild?.focus(); return
    }
    // if (e.key == 'Enter') {
    //   dispatch('select', e.target.textContent)
    // }
    if (e.key == 'Escape') {
      keyword = ''
      show = false
      input.blur(); return
    }
  }

  const handleResult = e => {
    if (e.key == 'ArrowUp') {
      e.preventDefault()
      let el = e.target.previousElementSibling
      el ? el.focus() : input.focus()
      return
    }
    if (e.key == 'ArrowDown') {
      e.preventDefault()
      let el = e.target.nextElementSibling
      el ? el.focus() : input.focus()
      return
    }
    if (e.key == 'Enter') {
      e.preventDefault()
      dispatch('select', e.target.textContent)
    }
  }

  const select = e => {
    dispatch('select', e.target.textContent)
  }

  const clear = () => {
    keyword = ''
    show = false
    input.blur()
  }

  const focus = () => {
    input.focus()
  }
</script>

{#if show}
<!-- <div class="bg"></div> -->
{/if}

<div on:click|stopPropagation class="quick-browse {$$props.class}">
    
    <div class="search">
      <button on:click={focus} class="icon">
        <RemixIcon icon="ri-search-2-line" size="1.1rem" />
      </button>
      <input on:focus={()=>show=true} bind:value={keyword} bind:this={input} on:keyup={handleInput} {placeholder}>
      {#if keyword}
      <button transition:fly|local={{x: 10, duration: 100}} on:click={clear} class="icon">
        <RemixIcon icon="ri-close-line" size="1.1rem" />
      </button>
      {/if}
    </div>
    
  {#if show}
  <div class="status-results">
    
    <div class="status">Found 24 Results</div>
    
    <div bind:this={results} class="results">
      <button on:click={select} on:keyup={handleResult}>Nokia Lumia 540</button>
      <button on:click={select} on:keyup={handleResult}>Huawei P20</button>
      <button on:click={select} on:keyup={handleResult}>Samsung S22 Plus 5G</button>
    </div>
    
  </div>
  {/if}
  
</div>

<!-- If clicked outside quick-browse body. Hide results.. -->
<svelte:window on:click={()=>show=false} />

<style>
  .bg {
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background-color: rgba(255, 255, 255, 0.9);
  }
  .quick-browse {
    /* max-width: 600px; */
    display: grid;
    position: relative;
    box-shadow: 0 0 7px 0 rgb(180, 180, 180);
  }
  .search:focus-within {
    border-color: green;
  }
  .search {
    border: var(--border);
    display: flex;
    align-items: center;
  }
  .search button {
    padding: 10px 13px;
  }
  .search input {
    flex: 1;
    padding: 10px 0;
    border: none;
  }
  .status {
    background-color: rgb(243, 243, 243);
    font-size: 0.9rem;
    padding: var(--padding);
    border: var(--border);
    border-top: none;
  }
  .results {
    display: grid;
  }
  .results > * {
    padding: var(--padding);
    border: var(--border);
    border-top: none;
  }
  .results button:focus {
    color: red;
    background-color: rgb(238, 238, 238);
  }
  .status-results {
    z-index: 22;
    background-color: #fff;
    width: 100%;
    top: 42px;
    position: absolute;
  }
</style>