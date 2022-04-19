<script>
  import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import { beautifyDateTime } from "$lib/others/utils";
  import { capitalize, kebabCase } from 'lodash-es'

  const Accounts = [
    {
      account_id: 1,
      name: 'Bank Al Habib',
      category: 'banks',
      debit: '0.00',
      credit: '0.00',
      created: ''
    }
  ]

  /** @type {Accounts} */
  export let accounts = []
</script>

{#if accounts.length != 0}
<Table>
  <tr>
    <th>({accounts.length})</th>
    <th>ID</th>
    <th class="main">Account Name</th>
    <!-- <th>Category</th> -->
    <th>Debit</th>
    <th>Credit</th>
    <th>Created</th>
    <th></th>
  </tr>
  {#each accounts as account, index (account.account_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{account.account_id}</td>
    <td><a href="/accounts/{kebabCase(account.name)}?account_id={account.account_id}">{account.name}</a></td>
    <!-- <td>{capitalize(account.category)}</td> -->
    <td style="min-width: 150px">{account.debit || '0.00'}</td>
    <td style="min-width: 150px">{account.credit || '0.00'}</td>
    <td>{beautifyDateTime(account.created)}</td>
    <td><a href="/accounts/edit-account?account_id={account.account_id}">Edit</a></td>
  </tr>
  {/each}
</Table>

{:else}
<Nothing>
  No Accounts.
</Nothing>
{/if}