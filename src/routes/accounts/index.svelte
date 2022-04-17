<script>
  import Pagination from "$lib/components/Pagination.svelte";
  import Table from "$lib/components/Table.svelte";
  import { beautifyDateTime } from "$lib/others/utils";
  import Button from "../../lib/components/Button.svelte";
  import Flex from "../../lib/components/Flex.svelte";
  import Title from "../../lib/components/Title.svelte";

  export let accounts = [], totalRows = 0
</script>

<Title title="Accounts" />

<Flex>
  <Button href="/accounts/add-account" type="primary" name="+ Add Account" />
  <Button name="Search Accounts" />
</Flex>

<Table>
  <tr>
    <th>Sr.</th>
    <th>ID</th>
    <th class="main">Account Name</th>
    <th>Debit</th>
    <th>Credit</th>
    <th>Created</th>
  </tr>
  {#each accounts as account, index (account.account_id)}
    <tr>
      <td>{index + 1}</td>
      <td>{account.account_id}</td>
      <td>{account.name}</td>
      <td>2000</td>
      <td>45000</td>
      <td>{beautifyDateTime(account.created)}</td>
    </tr>
  {/each}
</Table>

<Pagination {totalRows} />