<script>
  import { kebabCase, startCase } from "lodash-es";

  export let baseUrl = ''
  export let items = ['javascript', 'python', 'css', 'html', 'svelte', 'expressjs', 'mysql']
</script>

<div class="link-tags">
  {#each items as tag}
    <a href="{baseUrl}/{kebabCase(tag)}">{startCase(tag)}</a>
  {/each}
</div>

<style>
  .link-tags {
    display: flex;
    column-gap: 10px;
    /* outline: 1px solid red; */
  }
  .link-tags > * {
    padding: var(--padding);
    border: var(--border);
    border-radius: 20px;
  }
</style>