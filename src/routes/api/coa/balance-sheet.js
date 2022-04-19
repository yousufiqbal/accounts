import { knex } from '$lib/database/knex'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {

  const body = await request.json()
  await knex('coa').insert(body)
  return { body: { message: 'Asset added' }}
  
}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const del = async ({url}) => {

  try {
    const coa_id = +url.searchParams.get('coa_id')
    await knex('coa').delete().where({ coa_id })
    return { body: { message: 'Removed' }}
  } catch (error) {
    return internalError(error)
  }

}