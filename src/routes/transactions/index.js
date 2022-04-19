import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const page = +url.searchParams.get('page') || 1
  const limit = +url.searchParams.get('limit') || 15

  const { totalRows } = await knex('transactions').count({ totalRows: 'transaction_id'}).first()

  const transactions = await knex('transactions').limit(limit).offset((page - 1) * limit)
    .orderBy('created', 'desc')

  return {
    body: { totalRows, transactions }
  }

}