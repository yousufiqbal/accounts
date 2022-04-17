export const getOtherQueryParams = (items = [], $pg, opts = { start: false }) => {
  if (items.length == 0) return ''
  let result = ''
  items = items.filter(el => $pg.url.searchParams.get(el))
  for (const [index, item] of items.entries()) {
    let value = $pg.url.searchParams.get(item) || ''
    if (opts.start && index == 0) {
      result += '?' + item + '=' + value + (+index+1 == items.length ? '' : '&')
    } else {
      result += '&' + item + '=' + value + (+index+1 == items.length ? '' : '&')
    }
  }
  return result
}