<script>
  import Filter from "$lib/components/Filter.svelte";
  import Pagination from "$lib/components/Pagination.svelte";
  import Table from "$lib/components/Table.svelte";
  import { beautifyDateTime } from "$lib/others/utils";
import Accounts from "$lib/tables/Accounts.svelte";
  import Button from "../../lib/components/Button.svelte";
  import Flex from "../../lib/components/Flex.svelte";
  import Title from "../../lib/components/Title.svelte";

  export let accounts = [], original = [...accounts], totalRows = 0
</script>

<Title title="Accounts" />

<Flex>
  <Button href="/accounts/add-account" type="primary" name="+ Add Account" />
  <Button name="Search Accounts" href="/accounts/search" />
  <Filter {original} bind:results={accounts} />
</Flex>

<Accounts {accounts} />

<Pagination {totalRows} />