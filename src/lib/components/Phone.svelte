<script>
  export let href = '/samsung/galaxy-s22-plus', name = 'Galaxy S22+'
</script>

<a {href} class="phone">
  <img src="/phone.jpg" width="80" alt="phone">
  <div class="name">{name}</div>
</a>

<style>
  .phone {
    width: 100px;
    display: flex;
    flex-direction: column;
    justify-items: start;
    align-items: center;
    row-gap: 10px;
    /* outline: 1px solid red; */
  }
  .phone:hover .name {
    color: green;
  }
  .name {
    /* outline: 1px solid red;; */
    padding-bottom: 2px;
    text-align: center;
    border: 1px solid white;
  }
</style>