<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  
    const crumbs = [
      { name: 'Reports', href: '/reports' },
      { name: 'Trial Balance', href: '/reports/trial-balance' }
    ]
  </script>
  
  <Breadcrumb {crumbs} />
  
  <Title back title="Trial Balance" />