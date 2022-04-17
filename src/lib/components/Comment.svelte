<script>
import Avatar from "./Avatar.svelte";

import Button from "./Button.svelte";

import ButtonGroup from "./ButtonGroup.svelte";


</script>

<div class="comment">
  <div class="left">
    <Avatar />
  </div>
  <div class="right">
    <textarea name="" id="" cols="30" rows="3"></textarea>
    <ButtonGroup --justify-content="end">
      <Button icon="ri-delete-bin-line" text="Discard" />
      <Button type="primary" icon="ri-send-plane-2-line" text="Send" />
    </ButtonGroup>
  </div>
</div>



<style>
  .comment {
    display: flex;
    column-gap: 20px;
    /* outline: 1px solid red; */
  }
  .right:focus-within {
    border-color: blue;
    /* box-shadow: var(--card-shadow); */
  }
  textarea {
    resize: none;
    border: none;
  }
  .right {
    flex: 1;
    padding: 15px;
    display: grid;
    row-gap: 20px;
    border: var(--border);
    border-radius: 5px;
  }
</style>