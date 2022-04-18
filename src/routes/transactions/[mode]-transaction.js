import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  const accounts = await knex('accounts').orderBy('created', 'desc')

  return {
    body: { accounts }
  }

}