import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({url}) => {
  const keyword = await url.searchParams.get('keyword')
  if (!keyword) return { status: 200}
  const accounts = await knex('accounts').select('account_id', 'name')
    .where('name', 'like', `%${keyword}%`).limit(5)
  console.log(accounts)
  return { body: accounts }
}