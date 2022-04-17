<script>
  import Pagination from "$lib/components/Pagination.svelte";
  import QuickBrowse from "$lib/components/QuickBrowse.svelte";
  import Accounts from "$lib/tables/Accounts.svelte";
  import Button from "../../lib/components/Button.svelte";
  import Flex from "../../lib/components/Flex.svelte";
  import Title from "../../lib/components/Title.svelte";

  export let accounts = [], totalRows = 0
</script>

<Title title="Accounts" />

<Flex>
  <Button icon="add" href="/accounts/add-account" type="primary" name="Add Account" />
  <!-- <Button icon="search" name="Search" href="/accounts/search" /> -->
  <QuickBrowse />
  <!-- <Filter {original} bind:results={accounts} /> -->
</Flex>

<Accounts {accounts} />

<Pagination {totalRows} />