<script>
  export let name, href = null
  /** @type {'general'|'primary'} */
  export let type = 'general'
</script>

{#if href}
  <a {href} class="button {type}">{name}</a>
{:else}
  <button on:click class="button {type}">{name}</button>
{/if}

<style>
  .button {
    /* outline: 1px solid red; */
    padding: var(--padding);
    border: var(--border);
  }
  .general {
    background-color: #fff;
  }
  .primary {
    background-color: var(--primary);
    color: white;
  }
</style>