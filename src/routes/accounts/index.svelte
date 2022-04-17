<script>
  import Button from "../../lib/components/Button.svelte";
import Group from "../../lib/components/Group.svelte";
  import Title from "../../lib/components/Title.svelte";
</script>

<Title title="Accounts" />

<Group>
  <Button href="/accounts/add-account" type="primary" name="Add Account" />
  <Button name="Search" />
</Group>