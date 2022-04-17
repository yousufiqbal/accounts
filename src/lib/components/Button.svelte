<script>
  import Icon from "./Icon.svelte"

  export let name, href = null
  /** @type {'general'|'primary'} */
  export let type = 'general'
  export let submit = false
  export let icon = null
</script>

{#if href}
  <a {href} class="button {type}">
    {#if icon}
    <Icon {icon} size="1.3rem" />
    {/if}
    <span>{name}</span>
  </a>
{:else}
  <button type="{ submit ? 'submit' : ''}" on:click class="button {type}">
    {#if icon}
    <Icon {icon} size="1.3rem" />
    {/if}
    <span>{name}</span>
  </button>
{/if}

<style>
  .button {
    display: flex;
    gap: 7px;
    /* outline: 1px solid red; */
    padding: var(--padding);
    border: var(--border);
  }
  .button:hover {
    box-shadow: 0 0 5px 0 rgba(143, 143, 143, 0.5);
  }
  .general {
    background-color: #fff;
  }
  .primary {
    background-color: var(--primary);
    color: white;
  }
</style>