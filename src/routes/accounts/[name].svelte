<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import { kebabCase } from 'lodash-es'

  export let account = {}

  const crumbs = [
    { name: 'Accounts', href: '/accounts' },
    { name: account.name, href: '/accounts/' + kebabCase(account.name) },
  ]
</script>

<Breadcrumb {crumbs} />
<Title title="{account.name} - Account" />