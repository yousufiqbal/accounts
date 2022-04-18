<script context="module">
  export function load({ error, status }) {
    return {
      props: {
        title: `${status}: ${error.message}`
      }
    };
  }
</script>

<script>
  import Title from '$lib/components/Title.svelte';

  export let title;
</script>

<Title {title} />