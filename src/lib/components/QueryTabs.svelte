<script>
  import { kebabCase, startCase } from "lodash-es";
  import { page } from '$app/stores'
  import { getOtherQueryParams } from "$lib/others/utils";
  import RemixIcon from "./RemixIcon.svelte";

  export let baseUrl = '/'
  export let items = []
  export let name = 'tab'
  export let keepParams = []

  // First is default
  $: current = $page.url.searchParams.get(name) || items[0]
  $: otherParams = getOtherQueryParams(keepParams, $page)
</script>

{#if items.length != 0}
<div class="query-tabs {$$props.class}">
  <button class="ico">
    <RemixIcon icon="ri-equalizer-line" size="1.3rem" />
  </button>
  {#each items as item}
  <a class:active={current == item} href="{baseUrl}?{name}={kebabCase(item)}{otherParams}">{startCase(item)}</a>
  {/each}
</div>
{/if}

<style>
  .ico {
    padding: var(--padding);
    border-top: var(--border);
    border-right: none;
  }
  .query-tabs {
    display: flex;
    /* border-bottom: var(--border); */
    /* border-image: linear-gradient(to right, black, rgb(255, 255, 255)) 1; */
    max-width: 700px;
  }
  a {
    /* border-bottom: var(--border); */
    padding: var(--padding);
    border: var(--border);
    border-right: none;
  }
  a:last-child {
    border-right: var(--border);
  }
  a:hover {
    /* color: red; */
    border-bottom: 1px solid red;
    box-shadow: 0 3px 5px rgb(216, 216, 216);
  }
  a.active {
    /* background-color: rgb(245, 245, 245); */
    color: red;
    border-bottom: 1px solid red;
  }
</style>