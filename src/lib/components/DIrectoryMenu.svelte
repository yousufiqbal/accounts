<script>
  const excludes = /__layout\.reset|index\.svelte|__layout\.svelte|__error\.svelte/
  let paths = Object.keys(import.meta.glob('../routes/**')).filter(el => !excludes.test(el)).map(el => el.replace('../routes/', '')).map(el => el.replace('.svelte', ''))

  // https://stackoverflow.com/questions/22086928/array-of-directory-tree-node-js

  let obj = {}
  paths.forEach(function(path) {
    path.split('/').reduce(function(r, e) {
      return r[e] || (r[e] = {})
    }, obj)
  })

  console.log(obj)
</script>