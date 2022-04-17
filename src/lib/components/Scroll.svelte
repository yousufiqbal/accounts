<div class="scroll {$$props.class}">
  <slot></slot>
</div>

<style>
  .scroll {
    width: calc(100vw - 40px);
    overflow-x: auto;
  }
  @media (min-width: 1000px) {
    .scroll {
      width: 100%;
      overflow: initial;
    }
  }
</style>