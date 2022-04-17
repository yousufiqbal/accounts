<script>
  import FlexSpaced from "$lib/components/FlexSpaced.svelte";

  export let title = '', author = '', dated = ''
  export let href = '/'
</script>

<div class="blog {$$props.class}">

  <div class="image"></div>
  <a {href} class="title">{title}</a>
  <FlexSpaced --align-items="end">
    <div class="dated">{dated}</div>
    <div class="author"><strong>- </strong>{author}</div>
  </FlexSpaced>
  
</div>

<style>
  .blog {
    display: grid;
    row-gap: 13px;
    padding: 15px;
    border: var(--border);
    color: black;
    transition: box-shadow 100ms;
    
    /* margin-bottom: 20px; */
    box-shadow: 0 0 7px 0 rgb(180, 180, 180);
  }
  .image {
    background-color: rgb(221, 221, 221);
    height: 150px;
    border-radius: 10px;
  }
  .title {
    font-family: 'Bree Serif';
    font-size: 1.2rem;
    color: green;
  }
  a:hover {
    color: initial;
  }
  .title:hover {
    color: blue;
  }
  .dated {
    color: rgb(22, 22, 22);
  }
  .author {
    color: rgb(71, 71, 255);
  }
</style>