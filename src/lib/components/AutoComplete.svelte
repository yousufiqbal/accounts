<script>
  import { startCase } from "lodash-es";
  
  // TODO fix status border issue
  export let items = []
  export let idColumn = '', valueColumn = ''
  let originalItems = [...items]
  export let selectedId = null
  let previousId = null
  let keyword = selectedId ? getSelectedValue() : ''
  let show = false
  
  const getSelectedValue = () => startCase(items.filter(el => el[idColumn] == +selectedId)[0].name)

  // DOM
  let list, input

  const handleInput = e => {
    if (e.key == 'ArrowDown') { 
      e.preventDefault()
      list.firstElementChild.focus(); return
    }
    if (e.key == 'ArrowUp') { 
      e.preventDefault()
      list.lastElementChild.focus(); return
    }
    if (e.key == 'Escape') { 
      e.preventDefault()
      reselect()
    }
  }

  const handleList = e => {
    if (e.key == 'ArrowDown') {
      e.preventDefault()
      let el = e.target.nextElementSibling
      el ? el.focus() : input.focus()
      return
    }
    if (e.key == 'ArrowUp') {
      e.preventDefault()
      let el = e.target.previousElementSibling
      el ? el.focus() : input.focus()
      return
    }
    if (e.key == 'Enter') {
      e.preventDefault()
      keyword = e.target.textContent
      selectedId = e.target.id
      show = false
    }
    if (e.key == 'Escape') {
      e.preventDefault()
      reselect()
    }
  }
  
  const reselect = () => {
    if (previousId) {
      selectedId = previousId
      keyword = getSelectedValue()
    } else {
      input.blur()
    }
    show = false
  }

  const edit = () => {
    input.placeholder = keyword
    keyword = ''
    previousId = selectedId
    selectedId = null
    show = true
    setTimeout(() => {
      input.focus()
    }, 10);
  }

  const filter = () => {
    if (!keyword) {
      items = [...originalItems]
      return
    }

    // If numeric.. search ID
    if (/^[\d]+$/g.test(keyword.trim())) {
      items = originalItems.filter(el => +el[idColumn] == +keyword)
      return
    }

    // If alphabet and dash.. search Value
    if (/^[a-zA-Z-]+$/g.test(keyword.trim())) {
      items = originalItems.filter(el => el[valueColumn].toLowerCase().includes(keyword.toLowerCase()))
      return
    }
  }
</script>

{#if originalItems.length != 0}
<div on:click|stopPropagation class="auto-complete">
  
  <div class="search">
    <input bind:value={keyword} placeholder="Enter Name or ID" on:focus={()=>show=true} on:keyup={filter} disabled={selectedId} bind:this={input} on:keydown={handleInput} type="text">
    {#if selectedId}
    <button on:click={edit}>Edit</button>
    {/if}
  </div>
  
  {#if show}
  <!-- TODO fix border-bottom issue -->
  <div class="stats">Showing {items.length} of {originalItems.length}</div>
  
  {#if items.length != 0}
  <div bind:this={list} class="list">
    {#each items as item}
    <button on:keydown={handleList} id="{item[idColumn]}">{startCase(item[valueColumn])}</button>
    {/each}
  </div>
  {/if}
  {/if}
  
</div>
{/if}

<svelte:window on:click={reselect} />

<style>
  .auto-complete {
    /* outline: 1px solid red; */
    display: grid;
    margin-bottom: 20px; /** temp */
  }
  .stats {
    border: var(--border);
    padding: var(--padding);
    border-top: none;
    background-color: rgb(240, 240, 240);
    border-bottom: none;
  }
  .search {
    display: flex;
  }
  .search input {
    flex: 1;
    padding: var(--padding);
    border: var(--border);
  }
  .search button {
    padding: var(--padding);
    border: var(--border);
    border-left: none;
  }
  .list {
    display: grid;
    border: var(--border);
    border-bottom: none;
  }
  .list button {
    padding: var(--padding);
    border-bottom: var(--border);
  }
  button:focus {
    color: red;
    background-color: rgb(255, 237, 237);
  }
</style>