<script>
  import { slide } from 'svelte/transition'

  export let title, body
  let show = false
  const toggle = () => show = !show
</script>
<!-- Checking comment -->

<div class="accordion {$$props.class}">
  <button on:click={toggle} class="title">
    <span>{title}</span>
    <i class="{!show ? 'ri-arrow-down-s-line' : 'ri-arrow-up-s-line'} ri-xl"></i>
  </button>
  {#if show}
  <div transition:slide|local={{duration: 100}} class="body">{body}</div>
  {/if}
</div>

<style>
  .accordion {
    /* outline: 1px solid red; */
    display: grid;
    max-width: 500px;
    border: var(--border);
  }
  button {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  button span {
    font-weight: bold;
  }
  .title {
    padding: var(--padding);
  }
  .body {
    border-top: var(--border);
    padding: var(--padding);
    /* Increased padding for better spacing */
    padding-bottom: 10px;
  }
</style>