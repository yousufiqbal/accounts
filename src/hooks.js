/** @type {import('@sveltejs/kit').Handle} */
export const handle = async ({ event, resolve }) => {

  // Log
  console.log('----------------')
  console.log(event.request.url)


  return await resolve(event)
}