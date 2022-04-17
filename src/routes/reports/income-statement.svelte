<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  
    const crumbs = [
      { name: 'Reports', href: '/reports' },
      { name: 'Income Statement', href: '/reports/income-statement' }
    ]
  </script>
  
  <Breadcrumb {crumbs} />
  
  <Title back title="Income Statement" />