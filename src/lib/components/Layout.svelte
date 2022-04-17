<div class="layout">
  <div class="main">
    <slot name="main"></slot>
  </div>
  <div class="related">
    <slot name="related"></slot>
  </div>
</div>

<style>
  .layout {
    display: grid;
  }
  .related {
    display: none;
  }
  @media (min-width: 1000px) {
    .layout {
      grid-template-columns: 2.5fr 1.2fr;
      column-gap: 40px;
    }
    .related {
      display: initial;
    }
  }
</style>