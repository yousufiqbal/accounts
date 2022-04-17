<script>
  import Icon from "./Icon.svelte";
  import { slide } from 'svelte/transition'

  export let show = false
  let input

  const handleShortcut = e => {
    if (e.key == 'Escape') {
      input.blur()
    }
  }
</script>

<div class="quick-browse">

  <div class="search" style="display: flex">
    <Icon icon="plane" size="1.3rem" />
    <input bind:this={input} on:focus={()=>show=true} on:blur={()=>show=false} placeholder="Quick Browse">
  </div>

  {#if show}
  <div transition:slide|local={{duration: 100}} class="status-suggestions">
    <div class="status">Status</div>
    <div class="suggestions">
      <a href="/accounts/bank-al-habib">Bank Al Habib</a>
      <a href="/accounts/habib-metro">Habib Metro</a>
      <a href="/accounts/bank-al-habib">Bank Al Habib</a>
      <a href="/accounts/habib-metro">Habib Metro</a>
    </div>
  </div>
  {/if}

</div>

<svelte:window on:keyup={handleShortcut} />

<style>
  .quick-browse {
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