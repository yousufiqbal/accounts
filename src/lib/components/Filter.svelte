<script>
  let keyword = ''
  export let original, results

  const filter = () => {
    if (!keyword) {
      results = [...original]
      return
    }
    results = original.filter(el => el.name.toLowerCase().includes(keyword.toLowerCase()))
  }
</script>

<div class="filter">
  <input on:keyup={filter} bind:value={keyword} placeholder="Filter Items">
</div>

<style>
  input {
    border: var(--border);
    padding: var(--padding);
  }
</style>