<script>
  import Button from "./Button.svelte";
  import Flex from "./Flex.svelte";
  import Validation from "./Validation.svelte";

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

  /** @param {Array} lines */
  const checkUniqueAccounts = lines => {
    const ids = lines.filter(line => line.account_id).map(line => line.account_id)
    if (ids.length <= 1) return false
    return new Set(ids).size == ids.length
  }

  $: uniqueAccounts = checkUniqueAccounts(lines)
  $: totalDebit = lines.map(line => line.debit).reduce((a, b) => +a + +b, 0)
  $: totalCredit = lines.map(line => line.credit).reduce((a, b) => +a + +b, 0)
  $: balancedAmounts = totalDebit && totalCredit && totalDebit == totalCredit
</script>

<Flex>
  <Button on:click={addLine} name="Add Line" icon="add" />
</Flex>

<table class="lines">
  <tr>
    <th>Sr.</th>
    <th>Account</th>
    <th>ID</th>
    <th>Debit</th>
    <th>Credit</th>
    <th colspan="3">Actions</th>
  </tr>
  {#each lines as line, index}
  <tr>

    <td>{index+1}</td>

    <td>
      <select bind:value={line.account_id} name="" id="">
        <option value="" selected disabled hidden>Choose Account</option>
        {#each accounts as account}
        <option value="{account.account_id}">{account.name}</option>
        {/each}
      </select>
    </td>

    <td class="id">{line.account_id}</td>

    <td><input bind:value={line.debit} type="text"></td>
    <td><input bind:value={line.credit} type="text"></td>

    <td><button name="{String(index)}" on:click={upLine}>Up</button></td>
    <td><button name="{String(index)}" on:click={downLine}>Down</button></td>
    <td><button name="{String(index)}" on:click={removeLine}>Remove</button></td>

  </tr>
  {/each}
</table>

<Flex>
  <Validation text="Balanced Amounts" valid={balancedAmounts} />
  <Validation text="Unique Accounts" valid={uniqueAccounts} />
</Flex>

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