import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({url}) => {

  const category = url.searchParams.get('category') || 'all'

  const accounts = await knex('accounts')
    .orderBy('created', 'desc')
    .modify(qb => {
      if (category != 'all') qb.where({ category }) 
    })

  const categories = (await knex('accounts').distinct('category')).map(account => account.category)

  return {
    body: { accounts, categories }
  }

}