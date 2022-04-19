/* eslint-disable */
import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  `SELECT account_id, accounts.name, debit, credit
  FROM accounts
  LEFT JOIN lines USING (account_id)
  GROUP BY accounts.account_id`

  const trialBalances = await knex('accounts')
    .leftJoin('lines', 'lines.account_id', 'accounts.account_id')
    .groupBy('accounts.account_id')
    .select('accounts.account_id', 'accounts.name')
    .sum( { debit: 'lines.debit', credit: 'lines.credit' })

    console.log(trialBalances[0])

  return {
    body: { trialBalances }
  }

}