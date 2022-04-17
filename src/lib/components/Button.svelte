<script>
  export let name
  /** @type {'general'|'primary'} */
  export let type = 'general'
</script>

<button class="button {type}">{name}</button>

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