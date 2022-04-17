<script>
  import { fly } from 'svelte/transition'
  import RemixIcon from './RemixIcon.svelte'
  import { beforeNavigate, goto } from '$app/navigation'
  import { axios } from '$lib/others/utils';

  beforeNavigate(() => {
    show = false
  })

  export let placeholder = 'Quick Browse'
  export let keyword = '', show = false
  let results, input
  let suggestions = []

  const handleInput = e => {
    if (e.key == 'ArrowUp') {
      e.preventDefault()
      results.lastElementChild?.focus(); return
    }
    if (e.key == 'ArrowDown') {
      e.preventDefault()
      results.firstElementChild?.focus(); return
    }
    if (e.key == 'Enter') {
      e.preventDefault()
      search(); return
    }
    if (e.key == 'Escape') {
      keyword = ''
      show = false
      input.blur(); return
    }
    suggest()
  }

  const suggest = async () => {
    const response = await axios.get('/api/suggest?keyword=' + keyword)
    console.log(response.data)
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
  }

  const search = () => {
    goto('/search?keyword=' + keyword, { keepfocus: true })
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
    
    <!-- <div class="status">Found 24 Results</div> -->
    
    {#if suggestions && suggestions.length != 0}
    <div bind:this={results} class="results">
      <a on:keyup={handleResult} href="/nokia/nokia-lumia">Nokia Lumia 540</a>
      <a on:keyup={handleResult} href="/huawei/huawei-p20">Huawei P20</a>
      <a on:keyup={handleResult} href="/samsung/samsung-s22">Samsung S22 Plus 5G</a>
    </div>
    {/if}
    
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
  .results a:focus {
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