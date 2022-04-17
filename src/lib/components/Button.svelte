<script>
  import RemixIcon from "./RemixIcon.svelte";

  export let text, icon = null, href = null
  
  /** @type {'general'|'primary'} */
  export let type = 'general'
</script>

{#if href}
  <a {href} class="button {type} {$$props.class}">
    <RemixIcon {icon} size="1.2rem" />
    <span>{text}</span>
  </a>
{:else}
  <button on:click class="button {type} {$$props.class}">
    <RemixIcon {icon} size="1.3rem"  />
    <span>{text}</span>
  </button>
{/if}

<style>
  .button {
    display: inline-flex;
    column-gap: 8px;
    padding: 7px 12px 7px 10px;
    color: blue;
  }
  .general {
    border: var(--border);
    background-color: #fff;
  }
  .primary {
    /* border: 1px solid blue; */
    background-color: #0080FF;
    color: white;
  }
  .button:hover {
    /* color: red; */
    box-shadow: 0 0 4px 0 rgb(116, 116, 116);
  }
  .button.primary:hover {
    color: white;
  }
  .ghost {
    pointer-events: none;
    color: black;
    border: none;
    background-color: #fff;
    padding: 7px 0;
  }
</style>