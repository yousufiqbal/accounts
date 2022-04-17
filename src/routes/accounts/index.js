import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const page = +url.searchParams.get('page') || 1
  const limit = +url.searchParams.get('page') || 1

  const { totalRows } = await knex('accounts').count({ totalRows: 'account_id'}).first()
  const accounts = await knex('accounts').limit(limit).offset((page - 1) * limit)
    .orderBy('created', 'desc')

  console.log(accounts)

  return {
    body: { totalRows, accounts }
  }

}