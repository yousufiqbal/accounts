<script>
  import { fly } from 'svelte/transition'

  export let side = 'left'
</script>

<div on:click transition:fly={{x: -20, duration: 200}} class="drawer {side}">
  <slot></slot>
</div>

<style>
  .drawer {
    /* outline: 1px solid red; */
    background-color: #fff;
    position: fixed; top: 0;
    width: 200px;
    height: 100%;
    overflow-y: auto;
    box-shadow: var(--card-shadow);
    z-index: 10;
  }
  .left {
    left: 0;
    box-shadow: 5px 0 15px 0 rgba(131, 131, 131, 0.7);
  }
  .right {
    right: 0;
    box-shadow: -5px 0 5px 0 rgb(199, 199, 199, 0.7);
  }
</style>