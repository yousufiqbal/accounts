<script>
  import Drawer from "$lib/Drawer.svelte";
  import { kebabCase, startCase } from "lodash-es";
  import { slide } from 'svelte/transition'
  import { page } from '$app/stores'

  export let baseUrl = ''
  export let links = {
    'Yousuf': ['Jahangir', 'Waleed'],
    'Sajid' : [],
    'Shoaib': ['Kashif', 'Hamza', 'Bilal'],
    'Shahid': ['Faisal', 'Amir', 'Moin'],
  }

  let current = $page.url.pathname.match(/^\/([\w]+)/) ?
  $page.url.pathname.match(/^\/([\w]+)/)[1] : null;

  const setCurrent = e => {
    current = current == e.target.name ? null : e.target.name
  }
</script>

<Drawer>
  <nav class="menu">

    {#each Object.keys(links) as menu}

      {#if links[menu].length == 0}
      <a href="{baseUrl}/{kebabCase(menu)}">{startCase(menu)}</a>

      {:else}
      <button name="{kebabCase(menu)}" on:click={setCurrent}>{startCase(menu)}</button>

        {#if current == kebabCase(menu)}
        <nav transition:slide={{duration: 100}} class="submenu">

          {#each links[menu] as submenu}
          <a class:active={$page.url.pathname.startsWith(`${baseUrl}/${kebabCase(menu)}/${kebabCase(submenu)}`)} href="{baseUrl}/{kebabCase(menu)}/{kebabCase(submenu)}">{startCase(submenu)}</a>
          {/each}

        </nav>
        {/if}
      
      {/if} <!-- {#if links[menu].length == 0} -->

    {/each}
    
  </nav>
</Drawer>

<style>
  .active {
    background-color: rgb(255, 238, 238) !important;
  }
  .menu {
    /* outline: 1px solid red; */
    margin-top: 50px;
    display: grid;
  }
  .menu > :first-child {
    border-top: var(--border);
  }
  .menu > button, .menu > a {
    background-color: rgb(245, 245, 245);
    padding: var(--padding);
    border-bottom: var(--border);
  }
  .submenu {
    /* outline: 1px solid blue; */
    display: grid;
  }
  .submenu > a {
    padding: var(--padding);
    border-bottom: var(--border);
  }
</style>

