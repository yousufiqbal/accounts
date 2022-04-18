<script>
  import Button from "./Button.svelte";
  import Flex from "./Flex.svelte";
  import Icon from "./Icon.svelte";

  export let accounts = []

  const addLine = () => {
    lines.push({...line})
    lines = lines
  }

  const line = { credit: 0, debit: 0, account_id: '' }
  let lines = [{...line}]

  const upLine = () => {}
  const downLine = () => {}
  const removeLine = () => {}
</script>

<Flex>
  <Button on:click={addLine} name="Add Line" icon="add" />
</Flex>

<table class="lines">
  <tr>
    <th>Sr.</th>
    <th><Icon icon="search" /></th>
    <th>Account</th>
    <th>ID</th>
    <th>Debit</th>
    <th>Credit</th>
    <th colspan="3">Actions</th>
  </tr>
  {#each lines as line, index}
  <tr>
    <td>{index+1}</td>
    <td><input size="3"></td>
    <td>
      <select bind:value={lines[index].account_id} name="" id="">
        <option value="" selected disabled hidden>Choose Account</option>
        {#each accounts as account}
        <option value="{account.account_id}">{account.name}</option>
        {/each}
      </select>
    </td>
    <td class="id">{lines[index].account_id}</td>
    <td><input bind:value={lines[index].debit} type="text"></td>
    <td><input bind:value={lines[index].credit} type="text"></td>
    <td><button on:click={upLine}>Up</button></td>
    <td><button on:click={downLine}>Down</button></td>
    <td><button on:click={removeLine}>Remove</button></td>
  </tr>
  {/each}
</table>

<style>
  .id {
    padding: var(--padding);
  }
  table {
    border-collapse: collapse;
    margin-bottom: 40px;
  }
  th {
    font-weight: bold;
    padding: var(--padding);
  }
  th, td {
    border: var(--border);
  }
  input:focus {
    background-color: rgb(230, 236, 255);
    /* outline: 1px solid red; */
  }
  button {
    padding: var(--padding);
    color: blue;
  }
  button:hover {
    color: red;
  }
  input, select {
    border: none;
    padding: var(--padding)
  }
  td:first-child {
    padding: var(--padding);
  }
</style>