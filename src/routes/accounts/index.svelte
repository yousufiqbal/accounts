<script>
  import QuickAccounts from "$lib/components/QuickAccounts.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Tabs from "$lib/components/Tabs.svelte";
  import Accounts from "$lib/tables/Accounts.svelte";
  import Button from "../../lib/components/Button.svelte";
  import Flex from "../../lib/components/Flex.svelte";
  import Title from "../../lib/components/Title.svelte";

  export let accounts = []
  export let categories = []
</script>

<Title title="Accounts" />

<Flex>
  <Button icon="add" href="/accounts/add-account" type="primary" name="Add Account" />
  <QuickAccounts />
</Flex>

<Tabs name="category" baseUrl="/accounts" items={categories} />

<Accounts {accounts} />
