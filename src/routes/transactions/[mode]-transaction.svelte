<script>
  import { page } from "$app/stores";

  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Field from "$lib/components/Field.svelte";
  import Grid from "$lib/components/Grid.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Transactions', href: '/transactions' },
    { name: $page.params.mode + ' Transaction', href: '/transactions/' + $page.params.mode + '-transaction' }
  ]

  export let transaction = {}
</script>

<Breadcrumb {crumbs} />
<Title back title="Add Transaction" />


<Grid columns="1fr"  >
  <Field label="Datetime" name="datetime" />
  <Field label="Narration" name="datetime" />
</Grid>

<Subtitle subtitle="Lines" />

<!-- <Flex>
  <Button type="primary" icon="save" name="Save" />
  <Button icon="discard" name="Discard" />
</Flex> -->