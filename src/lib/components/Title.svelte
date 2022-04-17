<script>
  import { fly } from 'svelte/transition'
  import { startCase } from 'lodash-es'
  import RemixIcon from './RemixIcon.svelte';

  export let text, below = '', description = text, back = null
</script>

<svelte:head>
  <title>SpecNitro - {startCase(text)}</title>
  <meta name="description" content="{description}">
</svelte:head>

<div class="title {$$props.class}">
  
  <!-- Back Button -->
  {#if back}
  <button class="back" on:click={()=>history.go(-1)}>
    <RemixIcon icon="ri-arrow-left-line" size="2rem" />
  </button>
  {/if}
  
  <!-- Title & Below -->
  <div in:fly|local={{x: -20, duration: 150}}>
    <h1>{text}</h1>
    {#if below}
    <div>{below}</div>
    {/if}
  </div>

</div>

<style>
  .title {
    /* outline: 1px solid red; */
    display: flex;
    column-gap: 10px;
  }
  h1 {
    font-family: "Bree Serif";
    font-size: 1.4rem;
  }
  .back {
    display: flex;
  }
  .back:hover {
    color: green;
  }
</style>