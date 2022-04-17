<script>
  import Filter from "./Filter.svelte";

  export let original, records
  export let placeholder
  export let column

  const filter = e => {
    // case-insensitive
    let keyword = e.target.value.toLowerCase()
    if (!keyword) {
      records = [...original]
      return
    }
    records = original.filter(el => el[column].toLowerCase().includes(keyword))
  }
</script>

<div class="smart-filter {$$props.class}">
  <Filter {placeholder} on:keyup={filter} />
</div>