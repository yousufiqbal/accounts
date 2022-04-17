<script>
  import Button from "./Button.svelte"
import RemixIcon from "./RemixIcon.svelte"

  let top = '0', left = '0'
  let show = false

  // Right click open context menu with click co-ordinates
  const handleContextMenu = e => {
    // Stop default browser menu..
    e.preventDefault()
    top = e.clientY + 'px'
    left = e.clientX + 'px'
    show = true
  }

  // Escape closes the menu
  const handleKey = e => {
    if (e.key == 'Escape') {
      e.preventDefault()
      show = false
    }
  }
  
  // Outside click closes context menu
  const handleClick = () => {
    show = false
  }
</script>

{#if show}
<div on:click|stopPropagation style:top style:left class="context-menu">

  <button>
    <RemixIcon icon="ri-mail-send-line" />
    <span>Accounts</span>
  </button>

  <a href="/">
    <RemixIcon icon="ri-gas-station-line" />
    <span>Transactions</span>
  </a>

  <button>
    <RemixIcon icon="ri-line-chart-line" />
    <span>Reports</span>
  </button>
  
</div>
{/if}

<svelte:window on:click={handleClick} on:keydown={handleKey} on:contextmenu="{handleContextMenu}" />

<style>
  .context-menu {
    /* outline: 1px solid red; */
    position: absolute;
    background-color: #fff;
    display: grid;
    width: 160px;
  }
  .context-menu > * {
    display: flex;
    column-gap: 10px;
    border: var(--border);
    border-bottom: none;
    padding: var(--padding);
    color: blue;
  }
  .context-menu > :last-child {
    border-bottom: var(--border);
  }
  .context-menu > :hover {
    color: red;
    background-color: rgb(247, 247, 247);
  }
</style>