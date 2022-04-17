<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  
  const crumbs = [
    { name: 'Accounts', href: '/accounts' },
    { name:  $page.params.mode + ' Account', href: '/accounts/' + $page.params.mode + '-account' }
  ]
</script>

<Breadcrumb {crumbs} />