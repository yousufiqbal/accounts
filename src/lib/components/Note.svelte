<script>
  import RemixIcon from "./RemixIcon.svelte";

  let show = true
  export let text, type = 'general'
</script>

{#if show}
<div class="note {type} {$$props.class}">
  {#if type == 'info'}
  <RemixIcon icon="ri-information-line" size="1.3rem" />
  {/if}
  <span>{text}</span>
  <button on:click={()=>show=false} class="close">
    <RemixIcon icon="ri-close-line" size="1rem" />
  </button>
</div>
{/if}

<style>
  .note {
    position: relative;
    display: flex;
    column-gap: 10px;
    padding: var(--padding);
    border: var(--border);
  }
  .general {
    background-color: #fff;
  }
  .info {
    background-color: rgb(255, 252, 241);
  }
  .close {
    color: rgb(255, 255, 255);
    position: absolute;
    right: 8px;
    top: -8px;
    background-color: rgb(92, 92, 92);
    border: var(--border);
    /* border-radius: 50%; */
    padding: 2px;
  }
</style>