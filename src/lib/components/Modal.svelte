<script>
  import { fly } from 'svelte/transition'
</script>

<div class="wrapper">
  <div transition:fly|local={{y: -20, duration: 200}} class="modal">
    <slot></slot>
  </div>
</div>

<style>
  .wrapper {
    position: absolute;
    top: 0; left: 0;
    width: 100%; height: 100%;
    display: grid;
    place-items: center;
    background-color: rgba(184, 184, 184, 0.3);
  }
  .modal {
    display: grid;
    row-gap: 20px;
    background-color: #fff;
    max-width: 500px;
    padding: 30px;
    box-shadow: var(--card-shadow);
  }
</style>