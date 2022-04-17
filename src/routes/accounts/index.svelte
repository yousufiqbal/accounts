<script>
  import Button from "../../lib/components/Button.svelte";
  import Flex from "../../lib/components/Flex.svelte";
  import Title from "../../lib/components/Title.svelte";
</script>

<Title title="Accounts" />

<Flex>
  <Button href="/accounts/add-account" type="primary" name="Add Account" />
  <Button name="Search Accounts" />
</Flex>

