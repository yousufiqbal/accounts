<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
import TrialBalances from "$lib/tables/TrialBalances.svelte";

  export let trialBalances = []
  
  const crumbs = [
    { name: 'Reports', href: '/reports' },
    { name: 'Trial Balance', href: '/reports/trial-balance' }
  ]
  </script>
  
  <Breadcrumb {crumbs} />
  
  <Title back title="Trial Balance" />

  <TrialBalances {trialBalances} />