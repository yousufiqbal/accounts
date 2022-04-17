<script>
  export let name = null, href = "/", detail = null
</script>

<a {href} class="avatar">

  <div class="image"></div>

  {#if name || detail}
  <div class="right">
    {#if name}
    <div class="name">{name}</div>
    {/if}
    {#if detail}
    <div class="detail">{detail}</div>
    {/if}
  </div>
  {/if}

</a>

<style>
  .avatar {
    /* outline: 1px solid red; */
    display: flex;
    align-items: center;
    column-gap: 10px;
    color: black;
  }
  .image {
    width: var(--size, 32px);
    height: var(--size, 32px);
    background-color: rgb(204, 204, 204);
    border-radius: 50%;
  }
  .right {
    align-items: start;
  }
</style>