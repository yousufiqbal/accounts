<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import { sumIt } from "$lib/others/utils";
  import AccountTransactions from "$lib/tables/AccountTransactions.svelte";
  import { kebabCase } from 'lodash-es'

  export let account = {}

  const Transactions = [
    {
      transaction_id: 3,
      narration: 'Bought Cultus VXR 1000 CC',     
      debit: '0.00',
      credit: '1500000.00',
      created: ''
    }
  ]

  /** @type {Transactions} */
  export let transactions = []

  const crumbs = [
    { name: 'Accounts', href: '/accounts' },
    { name: account.name, href: '/accounts/' + kebabCase(account.name) },
  ]

  $: totalDebit = transactions.map(transaction => transaction.debit).reduce(sumIt, 0).toFixed(2)
  $: totalCredit = transactions.map(transaction => transaction.credit).reduce(sumIt, 0).toFixed(2)
</script>

<Breadcrumb {crumbs} />
<Title back title="{account.name} - Account" />

<AccountTransactions {transactions} />

<div class="balance">{totalDebit > totalCredit ? 'Debit Balance: ' + totalDebit : 'Credit Balance: ' + totalCredit}</div>

<style>
  .balance {
    text-align: right;
    font-weight: bold;
    border: var(--border);
    padding: var(--padding);
  }
</style>