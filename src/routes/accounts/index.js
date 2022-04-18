import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  const accounts = await knex('accounts')
    .orderBy('created', 'desc')

  let data = []

  const categories = [...new Set(accounts.map(account => account.category))].sort()

  for (const category of categories) {
    data.push({
      category,
      accounts: accounts.filter(account => account.category == category)
    })
  }

  return {
    body: { accounts: data }
  }

}