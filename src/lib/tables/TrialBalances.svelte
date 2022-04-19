<script>
import DatePicker from "$lib/components/DatePicker.svelte";

  import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import { kebabCase } from 'lodash-es'

  const TrialBalances = [
    {
      account_id: 1,        
      name: 'Bank Al Habib',
      debit: '2500000.00',  
      credit: '2500000.00'  
    }
  ]

  /** @type {TrialBalances} */
  export let trialBalances = []
</script>

<DatePicker />

{#if trialBalances.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <th>ID</th>
    <th class="main">Account Name</th>
    <th>Debit</th>
    <th>Credit</th>
  </tr>
  {#each trialBalances as trialBalance, index (trialBalance.account_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{trialBalance.account_id}</td>
    <td><a href="/accounts/{kebabCase(trialBalance.name)}?account_id={trialBalance.account_id}">{trialBalance.name}</a></td>
    <td style="min-width: 150px">{trialBalance.debit || '0.00'}</td>
    <td style="min-width: 150px">{trialBalance.credit || '0.00'}</td>
  </tr>
  {/each}
  <tr>
    <td class="total" colspan="3">Total</td>
    <td class="total">{trialBalances.map(account => account.debit).reduce((a, b) => +a + +b, 0).toFixed(2)}</td>
    <td class="total">{trialBalances.map(account => account.credit).reduce((a, b) => +a + +b, 0).toFixed(2)}</td>
  </tr>
</Table>

{:else}
<Nothing>
  No Trial Balances.
</Nothing>
{/if}