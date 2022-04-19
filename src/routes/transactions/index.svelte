<script>
  import Button from "$lib/components/Button.svelte";
  import Flex from "$lib/components/Flex.svelte";
  import Pagination from "$lib/components/Pagination.svelte";
  import Transactions from "$lib/tables/Transactions.svelte";
  import Title from "../../lib/components/Title.svelte";

  export let transactions = [], totalRows = 0
</script>

<Title title="Transactions" />

<Flex>
  <Button name="Add Transaction" href="/transactions/add-transaction" type="primary" icon="add" />  
  <Button name="Search" icon="search" />  
  <Pagination {totalRows} />
</Flex>

<Transactions {transactions} />