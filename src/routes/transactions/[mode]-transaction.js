import { knex } from '$lib/database/knex'
import dayjs from 'dayjs'

/** @type {import('./[mode]-transaction.js').RequestHandler} */
export const get = async ({ params, url }) => {

  const accounts = await knex('accounts').orderBy('created', 'desc')

  if (params.mode == 'edit') {
    const transaction_id = url.searchParams.get('transaction_id')
    let transaction = await knex('transactions').where({transaction_id}).first()
    transaction.lines = await knex('lines').where({transaction_id})
    transaction.datetime = dayjs(transaction.datetime).format('YYYY-MM-DD HH:mm')
    return {
      body: { accounts, transaction }
    }
  }

  return {
    body: { accounts }
  }

}