<script>
import { page } from "$app/stores";


  export let baseUrl = '/', name
  $: currentQuery = $page.url.searchParams.get(name) || 'All'
</script>

<div class="vertical-query {$$props.class}">
  <slot></slot>
  <a class:active={currentQuery == 'nokia'} href="{baseUrl}?{name}=nokia">Nokia</a>
  <a class:active={currentQuery == 'samsung'} href="{baseUrl}?{name}=samsung">Samsung</a>
  <a class:active={currentQuery == 'xiaomi'} href="{baseUrl}?{name}=xiaomi">Xiaomi</a>
  <a class:active={currentQuery == 'realme'} href="{baseUrl}?{name}=realme">Realme</a>
  <a class:active={currentQuery == 'nokia'} href="{baseUrl}?{name}=nokia">Nokia</a>
  <a class:active={currentQuery == 'samsung'} href="{baseUrl}?{name}=samsung">Samsung</a>
  <a class:active={currentQuery == 'xiaomi'} href="{baseUrl}?{name}=xiaomi">Xiaomi</a>
  <a class:active={currentQuery == 'realme'} href="{baseUrl}?{name}=realme">Realme</a>
  <a class:active={currentQuery == 'nokia'} href="{baseUrl}?{name}=nokia">Nokia</a>
  <a class:active={currentQuery == 'samsung'} href="{baseUrl}?{name}=samsung">Samsung</a>
  <a class:active={currentQuery == 'xiaomi'} href="{baseUrl}?{name}=xiaomi">Xiaomi</a>
  <a class:active={currentQuery == 'realme'} href="{baseUrl}?{name}=realme">Realme</a>
</div>

<style global>
  .vertical-query {
    box-shadow: 0 0 5px 0 rgb(209, 209, 209);
    display: grid;
    /* outline: 1px solid red; */
  }
  .vertical-query * {
    padding: var(--padding);
    border: var(--border);
    border-bottom: none;
  }
  .vertical-query *:hover {
    background-color: rgb(245, 245, 245);
    color: blue;
  }
  .vertical-query *:last-child {
    border-bottom: var(--border);
  }
  .active {
    color: red;
  }
</style>