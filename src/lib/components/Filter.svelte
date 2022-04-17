<script>
  import Icon from "./Icon.svelte";

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
  <Icon icon="filter" size="1.3rem" />
  <input on:keyup={filter} bind:value={keyword} placeholder="Filter Items">
</div>

<style>
  .filter {
    display: flex;
    gap: 0;
    border: var(--border);
    padding-left: 10px;
  }
  input {
    /* outline: 1px solid red; */
    border: none;
    padding: var(--padding);
  }
</style>