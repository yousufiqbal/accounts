<script>
import Button from "$lib/components/Button.svelte";
import Flex from "$lib/components/Flex.svelte";

  import Title from "../../lib/components/Title.svelte";
</script>

<Title title="Transactions" />

<Flex>
  <Button name="Add Transaction" href="/transactions/add-transaction" type="primary" icon="add" />  
  <Button name="Search" icon="search" />  
</Flex>