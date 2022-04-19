import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({url}) => {

  const category = url.searchParams.get('category') || 'all'

  // const accounts = await knex('accounts')
  //   .orderBy('created', 'desc')
  //   .modify(qb => {
  //     if (category != 'all') qb.where({ category }) 
  //   })

  const categories = (await knex('accounts').distinct('category')).map(account => account.category)

  const [ rows ] = await knex.raw(`
    SELECT account_id, accounts.name, accounts.category,
    case when (SUM(lines.debit) - SUM(lines.credit)) <= 0 then 0.00 ELSE SUM(lines.debit) - SUM(lines.credit) END AS debit,
    case when (SUM(lines.credit) - SUM(lines.debit)) <= 0 then 0.00 ELSE SUM(lines.credit) - SUM(lines.debit) END AS credit,
    accounts.created
    FROM accounts
    LEFT JOIN \`lines\` USING (account_id)
    WHERE accounts.category = ?
    GROUP BY accounts.account_id
  `, category)

  // console.log(rows[0])
  // console.log(accounts[0])

  return {
    body: { accounts: rows, categories }
  }

}