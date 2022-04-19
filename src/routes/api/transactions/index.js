import { knex } from '$lib/database/knex'
import { transactionSchema } from '$lib/database/schema'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({request}) => {

  try {
    // TODO do following inside transaction..
    const body = await request.json()
    const { narration, datetime, lines } = await transactionSchema.validate(body)
    const transaction_id = await knex('transactions').insert({ narration, datetime })
    await knex('lines').insert(lines.map(line => ({ ...line, transaction_id })))
    return { body: { message: 'Transaction added '}}
  } catch (error) {
    return internalError(error)
  }

}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({request, url}) => {

  const transaction_id = url.searchParams.get('transaction_id')
  console.log(transaction_id)

  try {
    // TODO do following inside transaction..
    const body = await request.json()
    const { narration, datetime, lines } = await transactionSchema.validate(body)
    await knex('transactions').update({ narration, datetime }).where( { transaction_id })
    await knex('lines').delete().where({ transaction_id })
    await knex('lines').insert(lines.map(line => ({ ...line, transaction_id })))
    return { body: { message: 'Transaction edited '}}
  } catch (error) {
    return internalError(error)
  }

}