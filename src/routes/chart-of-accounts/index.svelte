<script>
  import Navigation from "$lib/components/Navigation.svelte";
  import Title from "../../lib/components/Title.svelte";

  const links = [
    { name: 'Balance Sheet', href: '/chart-of-accounts/balance-sheet' },
    { name: 'Income Statement', href: '/chart-of-accounts/income-statement' },
    { name: 'Cash Flow Statement', href: '/chart-of-accounts/cash-flow-statement' }
  ]
</script>

<Title title="Chart of Accounts" />

<Navigation {links} />