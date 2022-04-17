<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Flex from "$lib/components/Flex.svelte";
  import Grid from "$lib/components/Grid.svelte";
  import Title from "$lib/components/Title.svelte";
  import { accountSchema, extractYupErrors } from "$lib/database/schema";
  import { axios } from "$lib/others/utils";
  import { onMount } from "svelte";

  onMount(() => {
    if ($page.params.mode == 'add') el.focus()
  })

  export let account = {}
  let touched = false, errors = {}
  
  const crumbs = [
    { name: 'Accounts', href: '/accounts' },
    { name:  $page.params.mode + ' Account', href: '/accounts/' + $page.params.mode + '-account' }
  ]

  let el

  const addAccount = async () => {
    try {
      const response = await axios.post('/api/accounts', account)
      alert(response.data.message)
      goto('/accounts')
    } catch (error) {
      alert(error.data.message)
    }
  }
  
  const editAccount = async () => {
    try {
      const response = await axios.put('/api/accounts?account_id=' + $page.url.searchParams.get('account_id'), account)
      alert(response.data.message)
      goto('/accounts')
    } catch (error) {
      alert(error.data.message)
    }
  }

  const submit = async () => {
    if (await accountSchema.isValid(account)) {
      if ($page.params.mode == 'add') await addAccount()
      if ($page.params.mode == 'edit') await editAccount()
    }
  }

  const validate = async () => {
    try {
      await accountSchema.validate(account, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  $: account && validate();
</script>

<Breadcrumb {crumbs} />

<Title back title="{$page.params.mode} Account" />

<Grid>
  <Field bind:el {touched} bind:value={account.name} label="Account Name" name="name" error={errors['name']} />
</Grid>

<Flex>
  <Button icon="save" submit={true} on:click={submit} name="Save" type="primary" />
  <Button icon="discard" on:click={()=>history.go(-1)} name="Discard" />
</Flex>