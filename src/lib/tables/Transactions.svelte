<script>
  import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import { beautifyDateTime } from "$lib/others/utils";
  import { capitalize, kebabCase } from 'lodash-es'

  const Transactions = [
    {
      transaction_id: 4,
      narration: '',  
      datetime: '',
      created: ''
    }
  ]

  /** @type {Transactions} */
  export let transactions = []
</script>

{#if transactions.length != 0}
<Table>
  <tr>
    <th>({transactions.length})</th>
    <th>ID</th>
    <th class="main">Narration</th>
    <th>Datetime</th>
    <th>Created</th>
    <th></th>
  </tr>
  {#each transactions as transaction, index (transaction.transaction_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{transaction.transaction_id}</td>
    <td><a href="/transactions/{kebabCase(transaction.narration)}?transaction_id={transaction.transaction_id}">{transaction.narration}</a></td>
    <td>{beautifyDateTime(transaction.datetime)}</td>
    <td>{beautifyDateTime(transaction.created)}</td>
    <td><a href="/transactions/edit-transaction?transaction_id={transaction.transaction_id}">Edit</a></td>
  </tr>
  {/each}
</Table>

{:else}
<Nothing>
  No transactions.
</Nothing>
{/if}