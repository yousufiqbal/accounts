<script>
  import Icon from "./Icon.svelte";
  import { slide } from 'svelte/transition'
  import { kebabCase } from "lodash-es";
  import { axios } from "$lib/others/utils";

  export let show = false
  let input, keyword = ''
  let suggestions

  let results = []

  const handleShortcut = e => {
    if (e.key == 'Escape') {
      input.blur()
    }
    if (e.ctrlKey && e.keyCode == '75') {
      e.preventDefault()
      input.focus()
    } 
  }

  const handleInput = e => {
    
    if (e.key == 'Enter') {
      const active = suggestions.querySelector('.active')
      if (active) active.click()
    }

    if (e.key == 'ArrowDown') {

      // check for active suggestion
      const active = suggestions.querySelector('.active')

      // if no.. select first suggestion
      if (!active) {
        const first = suggestions.firstElementChild
        first.classList.add('active')
        return
      }

      // if yes.. check for next sibling
      const next = active.nextElementSibling

      // if no.. select first suggestion.. removing current active..
      if (!next) {
        active.classList.remove('active')
        const first = suggestions.firstElementChild
        first.classList.add('active')
        return
      }

      // if yes.. select next suggestion.. removing current active..
      active.classList.remove('active')
      next.classList.add('active')
    }

    if (e.key == 'ArrowUp') {

      // check for active suggestion
      const active = suggestions.querySelector('.active')

      // if no.. select last suggestion
      if (!active) {
        const last = suggestions.lastElementChild
        last.classList.add('active')
        return
      }

      // if yes.. check for previous sibling
      const previous = active.previousElementSibling

      // if no.. select last suggestion.. removing current active..
      if (!previous) {
        active.classList.remove('active')
        const last = suggestions.lastElementChild
        last.classList.add('active')
        return
      }

      // if yes.. select previous suggestion.. removing current active..
      active.classList.remove('active')
      previous.classList.add('active')
    }
  }

  const search = async () => {
    // validate
    if (!keyword) {
      results = []
      return
    }

    // search
    const response = await axios.get('/api/accounts/suggest?keyword=' + keyword)
    results = response.data
  }
</script>

<div class="quick-browse">

  <div class="search" style="display: flex">
    <Icon on:click={()=>input.focus()} icon="plane" size="1.3rem" />
    <input bind:value={keyword} on:keyup={search} on:keyup={handleInput} bind:this={input} on:focus={()=>show=true} on:blur={()=>show=false} placeholder="Quick Accounts (Ctrl + K)">
  </div>

  {#if show}
  <div transition:slide|local={{duration: 100}} class="status-suggestions">
    {#if keyword}
    <div class="status">Found {results.length} results</div>
    {/if}
    <div bind:this={suggestions} class="suggestions">
      {#each results as account}
      <a href="/accounts/{kebabCase(account.name)}?account_id={account.account_id}">{account.name}</a>
      {/each}
    </div>
  </div>
  {/if}

</div>

<svelte:window on:keydown={handleShortcut} />

<style>
  .quick-browse {
    min-width: 400px;
    display: grid;
    position: relative;
  }
  .search {
    display: flex;
    gap: 10px;
    border: var(--border);
    padding-left: 10px;
  }
  input {
    flex: 1;
    border: none;
    padding: var(--padding);
    padding-left: 0;
  }
  .status-suggestions {
    top: 35px;
    position: absolute;
    display: grid;
    width: 100%;
  }
  .status {
    font-size: 0.9rem;
    background-color: rgb(231, 231, 231);
    padding: 4px 15px;
    border: var(--border);
  }
  .suggestions {
    box-shadow: 5px 5px 5px 0 rgba(181, 181, 181, 0.7);
    display: grid;
    background-color: #fff;
    /* padding: var(--padding); */
    border: var(--border);
    border-top: none;
    border-bottom: none;
  }
  .suggestions a {
    padding: var(--padding);
    border-bottom: var(--border);
  }
  a:hover {
    color: red;
  }

</style>