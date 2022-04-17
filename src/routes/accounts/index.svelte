<script>
  import Pagination from "$lib/components/Pagination.svelte";
import Table from "$lib/components/Table.svelte";
  import Button from "../../lib/components/Button.svelte";
  import Flex from "../../lib/components/Flex.svelte";
  import Title from "../../lib/components/Title.svelte";

  export let accounts = []
</script>

<Title title="Accounts" />

<Flex>
  <Button href="/accounts/add-account" type="primary" name="+ Add Account" />
  <Button name="Search Accounts" />
</Flex>

<Table>
  <tr>
    <th>Sr.</th>
    <th class="main">Account Name</th>
    <th>Debit</th>
    <th>Credit</th>
    <th>Created</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Yousuf Iqbal</td>
    <td>50000</td>
    <td>90000</td>
    <td>21 May, 2012 - 05:23 pm</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Yousuf Iqbal</td>
    <td>50000</td>
    <td>90000</td>
    <td>21 May, 2012 - 05:23 pm</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Yousuf Iqbal</td>
    <td>50000</td>
    <td>90000</td>
    <td>21 May, 2012 - 05:23 pm</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Yousuf Iqbal</td>
    <td>50000</td>
    <td>90000</td>
    <td>21 May, 2012 - 05:23 pm</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Yousuf Iqbal</td>
    <td>50000</td>
    <td>90000</td>
    <td>21 May, 2012 - 05:23 pm</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Yousuf Iqbal</td>
    <td>50000</td>
    <td>90000</td>
    <td>21 May, 2012 - 05:23 pm</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Yousuf Iqbal</td>
    <td>50000</td>
    <td>90000</td>
    <td>21 May, 2012 - 05:23 pm</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Yousuf Iqbal</td>
    <td>50000</td>
    <td>90000</td>
    <td>21 May, 2012 - 05:23 pm</td>
  </tr>
</Table>

<Pagination totalRows={200} otherParams={true} />