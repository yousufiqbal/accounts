<script>
import Phone from "./Phone.svelte";

</script>
<div class="versus-ring {$$props.class}">
  <Phone />
  <span class="vs">vs</span>
  <Phone />
  <span class="vs">vs</span>
  <Phone />
  <span class="vs">vs</span>
  <Phone />
  <span class="vs">vs</span>
  <Phone />
</div>

<style>
  .versus-ring {
    overflow-x: auto;
    flex-wrap: wrap;
    /* outline: 1px solid red; */
    display: flex;
    justify-content: center;
    align-items: center;
    column-gap: 1%;
    row-gap: 30px;
  }
  .vs {
    color: rgb(71, 71, 71);
    font-size: 2rem;
    font-family: 'Bree Serif';
  }
</style>