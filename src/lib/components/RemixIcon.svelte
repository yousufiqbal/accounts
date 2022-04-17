<script>
  
  
  export let icon = '', size = '1rem'
</script>

{#if icon}
<i on:click style:font-size={size} class={icon}></i>
{/if}

<style>
  i {
    display: flex;
    justify-content: center;
    /* align-items: center; */
    align-self: center;
  }
</style>