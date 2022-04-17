<!-- TODO improper grid.. -->

<div class="blog-group {$$props.class}">
  <slot></slot>
</div>

<style>
  .blog-group {
    display: grid;
    gap: 30px;
    /* max-width: 900px; */
  }
  @media (min-width: 1000px) {
    .blog-group {
      grid-template-columns: 1fr 1fr;
    }
  }
  /* @media (min-width: 1300px) {
    .blog-group {
      grid-template-columns: 1fr 1fr 1fr;
    }
  } */
</style>