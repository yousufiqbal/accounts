import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const account_id = +url.searchParams.get('account_id')
  const account = await knex('accounts').where('account_id', account_id).first()

  return {
    body: { account }
  }

}