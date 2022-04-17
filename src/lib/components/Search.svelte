<script>
  import RemixIcon from "./RemixIcon.svelte";

  let input = null
  export let keyword = ''
</script>

<div class="search">
  <button>
    <RemixIcon on:click={()=>input.focus()} icon="ri-search-2-line" />
  </button>
  <input bind:this={input} bind:value={keyword} on:keyup type="text">
  <button>
    <RemixIcon icon="ri-close-line" />
  </button>
</div>

<style>
  .search {
    /* outline: 1px solid red; */
    display: flex;
    border: var(--border);
  }
  input {
    border: none;
    flex: 1;
  }
  button {
    padding: 10px 10px;
  }
</style>