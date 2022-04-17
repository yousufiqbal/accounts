<script>
  import RemixIcon from "./RemixIcon.svelte";

  export let placeholder = 'Filter'
  let input

  const clear = () => {
    input.value = ''
    let event = new Event('keyup')
    input.dispatchEvent(event)
  }

  const handle = e => {
    if (e.key == 'Escape') clear()
  }
</script>

<div class="filter {$$props.class}">
  <button on:click={()=>input.focus()}>
    <RemixIcon icon="ri-filter-line" />
  </button>
  <input on:keyup={handle} bind:this={input} on:keyup {placeholder}>
  <button on:click={clear}>
    <RemixIcon icon="ri-close-line" />
  </button>
</div>

<style>
  .filter {
    max-width: 400px;
    display: flex;
    border: var(--border);
  }
  button {
    padding: 7px 10px;
  }
  input {
    padding: 7px 0;
    border: none;
    flex: 1
  }
</style>