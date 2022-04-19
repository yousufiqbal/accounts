<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
import AccountTransactions from "$lib/tables/AccountTransactions.svelte";
  import { kebabCase } from 'lodash-es'

  export let account = {}
  export let transactions = []

  const crumbs = [
    { name: 'Accounts', href: '/accounts' },
    { name: account.name, href: '/accounts/' + kebabCase(account.name) },
  ]
</script>

<Breadcrumb {crumbs} />
<Title back title="{account.name} - Account" />

<AccountTransactions {transactions} />