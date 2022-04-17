<script>
  import Layout from '$lib/Layout.svelte';
  import FolderMenu from '$lib/FolderMenu.svelte';

  import '$lib/styles/global.css'
  import '$lib/styles/variables.css'
  import 'remixicon/fonts/remixicon.css'
</script>

<FolderMenu />

<Layout>
  <slot></slot>
</Layout>