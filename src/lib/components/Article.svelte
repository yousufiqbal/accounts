<div class="article">
  <slot></slot>
</div>

<style global>
  .article {
    /* outline: 1px solid red; */
    display: grid;
    row-gap: 20px;
    margin: 30px auto;
    /* max-width: 600px; */
  }
  .article img {
    width: 100%;
    height: 250px;
    background-color: gray;
  }
  .article h1 {
    font-size: 2.3rem;
    font-weight: bold;
  }
  .article p {
    line-height: 1.5;
    font-size: 1.2rem;
  }
  .article h2 {
    font-weight: bold;
    font-size: 1.5rem;
  }
  .article blockquote {
    background-color: rgb(255, 238, 200);
    padding: 20px;
    font-size: 1.3rem;
  }
</style>