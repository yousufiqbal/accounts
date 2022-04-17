<script>
  export let checked
  export let label, name
</script>

<div class="checkbox">
  <input type="checkbox" bind:checked {name} id="{name}">
  <label for="{name}">{label}</label>
</div>

<style>
  .checkbox {
    /* outline: 1px solid red; */
    display: flex;
    align-items: center;
    column-gap: 7px;
    accent-color: green;
    user-select: none;
  }
</style>