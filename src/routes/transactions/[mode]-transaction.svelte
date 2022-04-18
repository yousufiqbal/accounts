<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Flex from "$lib/components/Flex.svelte";
  import Grid from "$lib/components/Grid.svelte";
  import Lines from "$lib/components/Lines.svelte";
  import Title from "$lib/components/Title.svelte";
  import dayjs from "dayjs";

  export let accounts = []

  const crumbs = [
    { name: 'Transactions', href: '/transactions' },
    { name: $page.params.mode + ' Transaction', href: '/transactions/' + $page.params.mode + '-transaction' }
  ]

  export let transaction = {
    datetime: dayjs().format('DD MMM, YYYY - HH:mm')
  }
</script>

<Breadcrumb {crumbs} />

<Title back title="Add Transaction" />

<Grid columns="1fr 2fr"  >
  <Field bind:value={transaction.datetime} label="Datetime" name="datetime" />
  <Field bind:value={transaction.narration} label="Narration" name="datetime" />
</Grid>

<Lines {accounts} />

<Flex>
  <Button name="Save" type="primary" icon="save" />
  <Button name="Discard" icon="discard" />
</Flex> 