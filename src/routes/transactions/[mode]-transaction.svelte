<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Flex from "$lib/components/Flex.svelte";
  import Grid from "$lib/components/Grid.svelte";
  import Lines from "$lib/components/Lines.svelte";
  import Title from "$lib/components/Title.svelte";
  import { extractYupErrors, transactionSchema } from "$lib/database/schema";
  import { axios } from "$lib/others/utils";
  import dayjs from "dayjs";

  export let accounts = []
  
  export let transaction = { datetime: dayjs().format('YYYY-MM-DD HH:mm') }
  let touched = false, errors = {}

  const submit = async () => {
    if (await transactionSchema.isValid(transaction)) {
      if ($page.params.mode == 'add') await addTransaction()
      if ($page.params.mode == 'edit') await editTransaction()
    } else {
      touched = true
    }
  }

  const addTransaction = async () => {
    try {
      const response = await axios.post('/api/transactions', transaction)
      alert(response.data.message)
    } catch (error) {
      alert(error.data.message)
    }
  }

  const editTransaction = async () => {
    try {
      const response = await axios.put('/api/transactions?transaction_id=' + $page.url.searchParams.get('transaction_id'), transaction)
      alert(response.data.message)
    } catch (error) {
      alert(error.data.message)
    }
  }

  const crumbs = [
    { name: 'Transactions', href: '/transactions' },
    { name: $page.params.mode + ' Transaction', href: '/transactions/' + $page.params.mode + '-transaction' }
  ]

  const validate = async () => {
    try {
      await transactionSchema.validate(transaction, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  $: transaction && validate()
</script>

<Breadcrumb {crumbs} />

<Title back title="{$page.params.mode} Transaction" />

<Grid columns="1fr 2fr"  >
  <Field {touched} bind:value={transaction.datetime} label="Datetime" name="datetime" error={errors['datetime']} />
  <Field {touched} bind:value={transaction.narration} label="Narration" name="narration" error={errors['narration']} />
</Grid>

<Lines bind:lines={transaction.lines} {accounts} />

<Flex>
  <Button on:click={submit} name="Save" type="primary" icon="save" />
  <Button name="Discard" icon="discard" />
</Flex> 