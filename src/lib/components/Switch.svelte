<script>
  export let state = false, disabled = true
</script>

<buttton disabled={disabled} on:click={()=>state=!state} class="switch">
  <div class="outer {state ? 'on' : 'off'}">
    <div class="inner"></div>
  </div>
</buttton>

<style>
  /* TODO disabled not working.. Please fix. */
  .switch:disabled .inner {
    background-color: rgb(180, 180, 180) !important;
  }
  .switch {
    cursor: pointer;
    display: inline-flex;
    width: 40px; height: 20px;
    /* outline: 1px solid red; */
  }
  .outer:hover {
    box-shadow: 0 4px 5px 0 rgb(189, 189, 189);
  }
  .outer {
    display: flex;
    align-items: center;
    flex: 1;
    padding: 5px;
    background-color: rgb(219, 219, 219);
    border-radius: 20px;
  }
  .inner {
    border-radius: 50%;
    height: 10px; width: 10px;
    background-color: #fff;
  }
  .on {
    background-color: rgb(130, 142, 255);
    justify-content: end;
  }
  .off {
    justify-content: start;
    background-color: rgb(219, 219, 219);
  }
</style>