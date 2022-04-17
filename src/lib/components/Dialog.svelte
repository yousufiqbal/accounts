<script>
  import Modal from "./Modal.svelte";

  /** Dialog has 3 parts: Head:title, Body:message & Foot:slot **/
  export let title, message
</script>

<div class="dialog">

  <Modal>
    <div class="head">{title}</div>
    <div class="body">{message}</div>
    <slot></slot>
  </Modal>

</div>

<style>
  .head {
    font-size: 1.2rem;
    font-weight: bold;
  }
</style>