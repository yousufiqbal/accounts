<script>
  import { invalidate } from "$app/navigation";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
  import { axios } from "$lib/others/utils";

  export let assets = []
  export let liabilities = []
  export let capitals = []

  export let accounts = []

  let current = {}
  
  const crumbs = [
    { name: 'Chart Of Accounts', href: '/chart-of-accounts' },
    { name: 'Balance Sheet', href: '/chart-of-accounts/balance-sheet' }
  ]

  const addAssetAccount = async () => {
    if (!current.asset_account_id) return
    const response = await axios.post('/api/coa/balance-sheet', {
      type: 'balance-sheet',
      element: 'asset',
      account_id: current.asset_account_id
    })
    alert(response.data.message)
    await invalidate('/chart-of-accounts/balance-sheet')
    current.asset_account_id = ''
  }

  const addLiabilityAccount = async () => {
        if (!current.liability_account_id) return
    const response = await axios.post('/api/coa/balance-sheet', {
      type: 'balance-sheet',
      element: 'liability',
      account_id: current.liability_account_id
    })
    alert(response.data.message)
    await invalidate('/chart-of-accounts/balance-sheet')
    current.liability_account_id = ''
  }

  const addCapitalAccount = async () => {
        if (!current.capital_account_id) return
    const response = await axios.post('/api/coa/balance-sheet', {
      type: 'balance-sheet',
      element: 'capital',
      account_id: current.capital_account_id
    })
    alert(response.data.message)
    await invalidate('/chart-of-accounts/balance-sheet')
    current.liability_account_id = ''
  }
  
  const removeAccount = async e => {
    const coa_id = +e.currentTarget.name
    const response = await axios.delete('/api/coa/balance-sheet?coa_id=' + coa_id)
    alert(response.data.message)
    await invalidate('/chart-of-accounts/balance-sheet')
  }
</script>

<Breadcrumb {crumbs} />

<Title back title="Balance Sheet" below="Statement of Financial Position" />

<div class="columns">

  <div class="column">

    <Subtitle subtitle="Assets ({assets.length})" />

    <div class="input">
      <select bind:value={current.asset_account_id}>
        <option value="" selected disabled hidden>Choose Account</option>
        {#each accounts as account}
        <option value="{account.account_id}">{account.name}</option>
        {/each}
      </select>
      <button on:click={addAssetAccount}>Add</button>
    </div>

    <div class="accounts">
      {#each assets as account}
      <div class="account">
        <div>{account.name}</div>
        <button on:click={removeAccount} name="{account.coa_id}">Remove</button>
      </div>
      {:else}
      <div class="no-account">
        - No Accounts
      </div>
      {/each}
    </div>

  </div>

  <div class="column">

    <Subtitle subtitle="Liabilities ({liabilities.length})" />

    <div class="input">
      <select bind:value={current.liability_account_id}>
        <option value="" selected disabled hidden>Choose Account</option>
        {#each accounts as account}
        <option value="{account.account_id}">{account.name}</option>
        {/each}
      </select>
      <button on:click={addLiabilityAccount}>Add</button>
    </div>

    <div class="accounts">
      {#each liabilities as account}
      <div class="account">
        <div>{account.name}</div>
        <button on:click={removeAccount} name="{account.coa_id}">Remove</button>
      </div>
      {:else}
      <div class="no-account">
        - No Accounts
      </div>
      {/each}
    </div>  

  </div>
  
  <div class="column">

    <Subtitle subtitle="Capitals ({capitals.length})" />

    <div class="input">
      <select bind:value={current.capital_account_id}>
        <option value="" selected disabled hidden>Choose Account</option>
        {#each accounts as account}
        <option value="{account.account_id}">{account.name}</option>
        {/each}
      </select>
      <button on:click={addCapitalAccount}>Add</button>
    </div>

    <div class="accounts">
      {#each capitals as account}
      <div class="account">
        <div>{account.name}</div>
        <button on:click={removeAccount} name="{account.coa_id}">Remove</button>
      </div>
      {:else}
      <div class="no-account">
        - No Accounts
      </div>
      {/each}
    </div>

  </div>

</div>

<style>
  .input {
    display: flex;
    margin-bottom: 20px;
  }
  select {
    flex: 1;
    padding: var(--padding);
    border: var(--border);
  }
  select:focus {
    border-color: blue;
  }
  .input button {
    padding: var(--padding);
    background-color: var(--primary);
    color: white;
  }
  .columns {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
  }
  .column {
    border: var(--border);
    padding: 20px;
    box-shadow: 0 0 5px 0 rgba(119, 119, 119, 0.5);
  }
  .accounts {
    display: grid;
  }
  .account {
    padding: var(--padding);
    border: var(--border);
    border-bottom: none;
    justify-content: space-between;
    display: flex;
  }
  .account:last-child {
    border-bottom: var(--border);
  }
  .account button {
    color: blue;
  }
  .account button:hover {
    color: red;
  }
  .no-account {
    margin-top: 10px;
    color: red;
  }
</style>