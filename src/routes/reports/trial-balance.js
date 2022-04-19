/* eslint-disable */
import { knex } from '$lib/database/knex'
import dayjs from 'dayjs'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async ({ url }) => {

  const start = dayjs(url.searchParams.get('start') || '2021-07-01', 'YYYY-MM-DD').format('YYYY-MM-DD')
  const end = dayjs(url.searchParams.get('end') || '2022-06-30', 'YYYY-MM-DD').format('YYYY-MM-DD')

  const trialBalances = await knex('accounts')
    .leftJoin('lines', 'lines.account_id', 'accounts.account_id')
    .leftJoin('transactions', 'lines.transaction_id', 'transactions.transaction_id')
    .groupBy('accounts.account_id')
    .select('accounts.account_id', 'accounts.name')
    .whereBetween('transactions.created', [start, end])
    .sum( { debit: 'lines.debit', credit: 'lines.credit' })

  return {
    body: { trialBalances }
  }

}