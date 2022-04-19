<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  
  const crumbs = [
    { name: 'Chart Of Accounts', href: '/chart-of-accounts' },
    { name: 'Income Statement', href: '/chart-of-accounts/income-statement' }
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Income Statement" />