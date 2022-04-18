<script>
import Actions from "$lib/components/Actions.svelte";

  import Pagination from "$lib/components/Pagination.svelte";
  import QuickAccounts from "$lib/components/QuickAccounts.svelte";
  import Accounts from "$lib/tables/Accounts.svelte";
  import Button from "../../lib/components/Button.svelte";
  import Flex from "../../lib/components/Flex.svelte";
  import Title from "../../lib/components/Title.svelte";

  export let accounts = [], totalRows = 0
</script>

<Title title="Accounts" />

<Actions>

  <svelte:fragment slot="left">
    <Button icon="add" href="/accounts/add-account" type="primary" name="Add Account" />
    <QuickAccounts />
  </svelte:fragment>
  
  <svelte:fragment slot="right">
    <Pagination {totalRows} />
  </svelte:fragment>

</Actions>

<Accounts {accounts} />