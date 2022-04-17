<script>
  export let text
</script>

<div class="nothing {$$props.class} mb20">
  {text}
</div>

<style>
  .nothing {
    max-width: 500px;
    /* background-color: rgb(255, 241, 241); */
    border-bottom: 1px dashed red;
    padding: 7px 0;
  }
</style>