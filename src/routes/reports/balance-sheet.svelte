<script>
import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Reports', href: '/reports' },
    { name: 'Balance Sheet', href: '/reports/balance-sheet' }
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Balance Sheet" />