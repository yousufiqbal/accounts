<script>
import Breadcrumb from "$lib/components/Breadcrumb.svelte";

  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Accounts', href: '/accounts' },
    { name: 'Search', href: '/accounts/search' }
  ]
</script>

<Breadcrumb {crumbs} />

<Title title="Search Accounts" back />