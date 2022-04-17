<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Navigation from '../lib/components/Navigation.svelte'

  const links = [
    { name: 'Accounts', href: 'accounts' },
    { name: 'Transactions', href: 'transactions' },
    { name: 'Chart of Accounts', href: 'chart-of-accounts' },
    { name: 'Reports', href: 'reports' },
  ]
</script>

<Navigation baseUrl="/" {links} />

<slot></slot>