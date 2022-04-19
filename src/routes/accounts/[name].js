/* eslint-disable */
import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const account_id = +url.searchParams.get('account_id')
  const account = await knex('accounts').where('account_id', account_id).first()

  const transactions = await knex('lines')
    .leftJoin('accounts', 'lines.account_id', 'accounts.account_id')
    .leftJoin('transactions', 'transactions.transaction_id', 'lines.transaction_id')
    .select('transactions.transaction_id', 'transactions.narration', 'lines.debit', 'lines.credit', 'transactions.created')
    .where('lines.account_id', account_id)

    console.log(transactions)

  return {
    body: { account, transactions }
  }

}