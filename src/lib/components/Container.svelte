<script>
  export let size = '500px'
</script>

<div style:max-width={size} class="container">
  <slot></slot>
</div>

<style>
  .container {
    outline: 1px solid red;
  }
</style>