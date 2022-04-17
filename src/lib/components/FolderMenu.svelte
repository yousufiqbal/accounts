<script>
import { page } from "$app/stores";

  import Drawer from "$lib/Drawer.svelte";
  import { kebabCase, startCase } from "lodash-es";

  const excludes = ['index', '__layout', '__error']

  const files = Object.keys(import.meta.glob('../routes/**.svelte'))
  const links = files.map(el => el.replace(/.svelte/g, '').replace(/\.\.\/routes\//g, '')).filter(el => !excludes.includes(el))
</script>

<Drawer>
  <div class="folder-menu">
    {#each links as link}
    
    {#if $page.url.pathname == '/' + kebabCase(link)}
    <div class="button active">{startCase(link)}</div>
    {:else}
    <a class:active={$page.url.pathname == '/' + kebabCase(link)} href="/{kebabCase(link)}">{startCase(link)}</a>
    {/if}

    {/each}   
  </div>
</Drawer>

<style>
  .folder-menu {
    display: grid;
    margin: 50px 0;
    /* outline: 1px solid red; */
  }
  .button, a {
    color: blue;
    padding: var(--padding);
    border-bottom: var(--border);
  }
  a:hover {
    color: red;
    background-color: rgb(247, 247, 247);
  }
  .active {
    color: black;
    background-color: rgb(247, 247, 247);
  }
</style>