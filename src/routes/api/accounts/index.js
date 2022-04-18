import { knex } from '$lib/database/knex'
import { accountSchema } from '$lib/database/schema'
import { internalError } from '$lib/others/utils'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const post = async ({ request }) => {

  const body = await request.json()

  try {
    const account = await accountSchema.validate(body)
    await knex('accounts').insert(account)
    return { status: 201, body: { message: 'Account added '} }
  } catch (error) {
    return internalError(error)
  }

}

/** @type {import('@sveltejs/kit').RequestHandler} */
export const put = async ({ request, url }) => {

  const body = await request.json()
  const account_id = url.searchParams.get('account_id')

  try {
    const account = await accountSchema.validate(body)
    await knex('accounts').update(account).where({ account_id })
    return { status: 201, body: { message: 'Account edited '} }
  } catch (error) {
    return internalError(error)
  }

}