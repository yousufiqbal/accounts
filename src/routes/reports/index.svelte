<script>
  import Navigation from "$lib/components/Navigation.svelte";
  import Title from "../../lib/components/Title.svelte";

  const links = [
    { name: 'Balance Sheet', href: '/reports/balance-sheet' },
    { name: 'Trial Balance', href: '/reports/trial-balance' },
    { name: 'Income Statement', href: '/reports/income-statement' },
    { name: 'Cash Flow Statement', href: '/reports/cash-flow-statement' },
  ]
</script>

<Title title="Reports" />

<Navigation {links} />