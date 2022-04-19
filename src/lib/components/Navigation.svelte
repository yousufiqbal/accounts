<script>
  const Links = [
    { name: '', href: '' }
  ]

  /** @type {Links} */
  export let links = []
</script>

{#if links.length != 0}
<div class="navigation">
  {#each links as link}
  <a href="{link.href}">{link.name}</a>
  {/each}
</div>
{/if}

<style>
  .navigation {
    /* outline: 1px solid red; */
    display: flex;
    border-left: var(--border);
    margin-bottom: 20px;
  }
  a {
    color: blue;
    padding: var(--padding);
    border: var(--border);
    border-left: none;
  }
  a:hover {
    color: red;
  }
</style>