<script>
  export let label, name, id = name, value = undefined
  export let touched = false, error = 'An error occured.'
  export let placeholder = null, maxlength = null, minlength = null
  export let el = null
</script>

<div class="field">
  <label for="{name}">{label}</label>
  <input bind:this={el} on:blur={()=>touched=true} bind:value {name} {id} {placeholder} {maxlength} {minlength} >
  {#if touched && error}
  <span>{error}</span>
  {/if}
</div>

<style>
  .field {
    /* outline: 1px solid red; */
    display: grid;
    align-content: start;
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
  input {
    align-self: start;
    padding: 13px 17px 7px 15px;
    border: var(--border);
  }
  input:focus {
    border-color: blue;
  }
</style>