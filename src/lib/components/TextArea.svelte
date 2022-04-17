<script>
  export let label, name, value = undefined, placeholder = null
  export let touched = false, errors = {}
  export let tabindex = "0"
  export let el = null
  export let cols = 30, rows = 10
</script>

<div class="field {$$props.class}">

  <label for="{name}">{label}</label>
  <textarea on:blur={()=>touched=true} bind:this={el} {tabindex} bind:value {placeholder} {name} id="{name}" {cols} {rows}></textarea>
  
  {#if touched && errors[name]}
  <div class="error">{errors[name]}</div>
  {/if}

</div>

<style>
  .field:focus-within {
    color: blue;
  }
  .field {
    /* outline: 1px solid red; */
    /* max-width: 300px; */
    display: grid;
  }
  label {
    color: inherit;
    /* outline: 1px solid red; */
    font-weight: bold;
    z-index: 1;
    background-color: #fff;
    justify-self: start;
    /* +1px margin-left since text is bold */
    margin-left: 11px;
    margin-bottom: -10px;
    padding: 0 5px;
  }
  textarea {
    padding: 13px 15px 7px 15px;
    border: var(--border);
  }
  .error {
    padding: var(--padding);
    border: var(--border);
    border-top: none;
    color: red;
    text-transform: capitalize;
  }
  textarea:focus {
    border: 1px solid blue;
  }
</style>