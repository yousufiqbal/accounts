/** @type {import('@sveltejs/kit').ParamMatcher} */
export function match(param) {
  return /^add$|^edit$/.test(param);
}