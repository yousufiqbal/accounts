<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Navigation from '../lib/components/Navigation.svelte'
  import Drawer from '$lib/components/Drawer.svelte';
import Layout from '$lib/components/Layout.svelte';
import Menu from '$lib/components/Menu.svelte';

  const links = [
    { name: 'Accounts', href: 'accounts' },
    { name: 'Transactions', href: 'transactions' },
    { name: 'Chart of Accounts', href: 'chart-of-accounts' },
    { name: 'Reports', href: 'reports' },
  ]
</script>

<Drawer>
  <Menu />
</Drawer>

<Layout>
  <!-- <Navigation baseUrl="/" {links} /> -->
  <slot></slot>
</Layout>