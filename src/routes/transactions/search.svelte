<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Search from "$lib/components/Search.svelte";
  import { axios } from "$lib/others/utils";
  import Transactions from "$lib/tables/Transactions.svelte";
  import { page } from "$app/stores";
  import { goto, invalidate } from "$app/navigation";

  let keyword = ''
  export let transactions = [], totalRows = 0
  
  const crumbs = [
    { name: 'Transactions', href: '/transactions' },
    { name: 'Search', href: '/transactions/search' }
  ]

  const search = async () => {
    if (!keyword) {
      goto($page.url.pathname, { keepfocus: true })
      transactions = []
      return 
    }
    goto($page.url.pathname + '?keyword=' + keyword, { keepfocus: true })
    await invalidate($page.url.pathname)
  }
</script>

<Breadcrumb {crumbs} />

<Title back title="Search Transactions" />

<Search bind:keyword on:keyup={search} />

<Transactions {transactions} />