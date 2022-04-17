<script>
import RemixIcon from "$lib/components/RemixIcon.svelte";

</script>

<div class="phone-highlights {$$props.class}">

  <div class="highlight">
    <RemixIcon icon="ri-camera-line" />
    <div>108 MP</div>
  </div>
  <div class="highlight">
    <RemixIcon icon="ri-battery-line" />
    <div>6000 mAh</div>
  </div>
  <div class="highlight" style:grid-columns="span 2">
    <RemixIcon icon="ri-artboard-2-line" />
    <div>Snapdragon 732 (6nm)</div>
  </div>
  <div class="highlight">
    <RemixIcon icon="ri-camera-line" />
    <div>4 GB / 128 GB</div>
  </div>

</div>

<style>
  .phone-highlights {
    display: grid;
    border: 1px solid rgb(204, 156, 52);
  }
  .highlight:nth-child(even) {
    background-color: rgb(255, 249, 222);
  }
  .highlight {
    /* color: rgb(0, 114, 38); */
    display: flex;
    align-items: center;
    column-gap: 10px;
    padding: var(--padding );
  }
</style>