<script>
  export let name = 'home', size = '1rem', fill = 'currentColor'
</script>

<svg on:click viewBox="0 0 24 24" {fill} width={size} height={size}>

  {#if name == 'home'}
  <path fill="none" d="M0 0h24v24H0z"/><path d="M21 20a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.49a1 1 0 0 1 .386-.79l8-6.222a1 1 0 0 1 1.228 0l8 6.222a1 1 0 0 1 .386.79V20zm-2-1V9.978l-7-5.444-7 5.444V19h14z"/>
  {/if}

  {#if name == 'back'}
    <path fill="none" d="M0 0h24v24H0z"/><path d="M7.828 11H20v2H7.828l5.364 5.364-1.414 1.414L4 12l7.778-7.778 1.414 1.414z"/>
  {/if}
  
</svg>