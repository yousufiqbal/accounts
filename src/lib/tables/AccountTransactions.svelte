<script>
  import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import { beautifyDateTime } from "$lib/others/utils";

  const AccountTransactions = [
    {
      transaction_id: 3,
      narration: 'Bought Cultus VXR 1000 CC',     
      debit: '0.00',
      credit: '1500000.00',
      created: ''
    }
  ]

  /** @type {AccountTransactions} */
  export let transactions = []
</script>

{#if transactions.length != 0}
<Table>
  <tr>
    <th>({transactions.length})</th>
    <th>ID</th>
    <th class="main">Narration</th>
    <th>Debit</th>
    <th>Credit</th>
    <th>Created</th>
    <th></th>
  </tr>
  {#each transactions as transaction, index (transaction.transaction_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{transaction.transaction_id}</td>
    <td><a href="/transactions/name-here?transaction_id={transaction.transaction_id}">{transaction.narration}</a></td>
    <td>{transaction.debit}</td>
    <td>{transaction.credit}</td>
    <td>{beautifyDateTime(transaction.created)}</td>
    <td><a href="/transactions/edit-transaction?transaction_id={transaction.transaction_id}">Edit</a></td>
  </tr>
  {/each}
  <!-- <tr>
    <td colspan="3"></td>
    <td class="total">{transactions.map(transaction => transaction.debit).reduce((a, b) => +a + +b, 0).toFixed(2)}</td>
    <td class="total">{transactions.map(transaction => transaction.credit).reduce((a, b) => +a + +b, 0).toFixed(2)}</td>
    <td colspan="2"></td>
  </tr> -->
</Table>

{:else}
<Nothing>
  No transactions
</Nothing>
{/if}