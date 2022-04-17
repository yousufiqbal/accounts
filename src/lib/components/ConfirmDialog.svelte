<script>
  import { createEventDispatcher } from "svelte";
  import Button from "./Button.svelte";
  import Dialog from "./Dialog.svelte";
  import FlexSpaced from "./FlexSpaced.svelte";

  export let title, message, yes = 'Yes', no = 'No'
  export let show = false
  const dispatch = createEventDispatcher()

  const doYes = () => {
    show = false
    dispatch('yes')
  }

  const doNo = () => {
    show = false
    dispatch('no')
  }
</script>

<!-- TODO add icons, later when internet is here -->
{#if show}
<Dialog {title} {message}>
  <FlexSpaced>
    <Button on:click={doYes} text="{yes}" type="primary" />
    <Button on:click={doNo} text="{no}" />
  </FlexSpaced>
</Dialog>
{/if}