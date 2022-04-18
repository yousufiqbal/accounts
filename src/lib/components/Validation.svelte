<script>
  import Icon from "$lib/components/Icon.svelte";
  
  export let valid = false
  export let text
</script>

<div class="validation">
  <Icon icon={valid ? 'check' : 'discard' } fill={valid ? 'green' : 'red'} size="1.3rem" />
  <span>{text}</span>
</div>

<style>
  .validation {
    display: flex;
    gap: 10px;
    padding: var(--padding);
    border: var(--border);
  }
</style>