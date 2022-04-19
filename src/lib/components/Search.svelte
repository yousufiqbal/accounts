<script>
  import Icon from "./Icon.svelte";

  export let keyword
</script>

<div class="search">
  <i>
    <Icon icon="search" />
  </i>
  <input on:keyup bind:value={keyword} placeholder="Enter Narration">
</div>

<style>
  .search {
    margin-bottom: 20px;
    border: var(--border);
    display: flex;
  }
  input {
    padding: var(--padding);
    padding-left: 0;
    border: none;
    flex: 1;
  }
  i {
    padding: var(--padding);
    display: flex;
  }
</style>