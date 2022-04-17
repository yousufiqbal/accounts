<div class="container">
  <slot></slot>
</div>

<style>
  .container {
    margin: 0 auto;
  }
  @media (min-width: 1000px) {
    .container {
      max-width: 80%;
    }
  }
</style>