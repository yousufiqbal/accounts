/** @type {import('@sveltejs/kit').Handle} */
export const handle = async ({ event, resolve }) => {

  // Log
  console.log('----------------')
  console.log(event.request.method, event.request.url.replace('http://localhost:3000', ''))


  return await resolve(event)
}