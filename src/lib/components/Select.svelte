<script>
  export let label, name, id = name, value = undefined
  export let touched = false, error = 'An error occured.'
  export let el = null
  export let items = []
  export let idColumn = null, valueColumn= null
</script>

{#if items.length != 0}
<div class="field">

  <label for="{name}">{label}</label>

  <select bind:this={el} on:blur={()=>touched=true} bind:value {name} {id}>
    <option value="" selected disabled hidden>Choose One</option>
    {#each items as item}
      {#if idColumn}
      <option value="{item[idColumn]}">{item[valueColumn]}</option>
      {:else}
      <option value="{item}">{item}</option>
      {/if}
    {/each}
  </select>
  
  {#if touched && error}
  <span>{error}</span>
  {/if}

</div>
{/if}

<style>
  .field {
    /* outline: 1px solid red; */
    display: grid;
    align-content: end;
    max-width: 400px;
  }
  label {
    font-weight: bold;
    background-color: #fff;
    /* border: 1px solid blue; */
    justify-self: start;
    padding: 0 7px;
    margin: 0 0 -10px 10px;
    z-index: 1;
    /* padding: var(--padding) */
  }
  span {
    border: var(--border);
    border-top: none;
    color: red;
    padding: 5px 15px;
    text-transform: capitalize;
  }
  select {
    align-self: start;
    padding: 13px 17px 7px 15px;
    border: var(--border);
    text-transform: capitalize;
  }
  select:focus {
    border-color: blue;
  }
</style>