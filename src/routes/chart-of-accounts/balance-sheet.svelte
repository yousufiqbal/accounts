<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  
  const crumbs = [
    { name: 'Chart Of Accounts', href: '/chart-of-accounts' },
    { name: 'Balance Sheet', href: '/chart-of-accounts/balance-sheet' }
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Balance Sheet" />