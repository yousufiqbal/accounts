<script>
  import Icon from "$lib/components/Icon.svelte";
  import { fly } from 'svelte/transition'
  
  export let valid = false
  export let text
</script>

<div class="validation">
  {#key valid}
  <i in:fly={{x: -20, duration: 100}} >
    <Icon icon={valid ? 'check' : 'discard' } fill={valid ? 'green' : 'red'} size="1.3rem" />
  </i>
  {/key}
  <span>{text}</span>
</div>

<style>
  i {
    display: flex;
  }
  .validation {
    display: flex;
    gap: 10px;
    padding: var(--padding);
    border: var(--border);
  }
</style>