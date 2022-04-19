import { knex } from '$lib/database/knex'

/** @type {import('@sveltejs/kit').RequestHandler} */
export const get = async () => {

  const balanceSheetAccounts = await knex('coa')
    .where('type', 'balance-sheet')
    .leftJoin('accounts', 'accounts.account_id', 'coa.account_id')
    .select('coa_id', 'coa.type', 'coa.element', 'coa.account_id', 'accounts.name')
  
  // Filtered accounts
  const accounts = await knex('accounts').whereNotIn('account_id', balanceSheetAccounts.map(account => account.account_id))
  
  const assets = balanceSheetAccounts.filter(account => account.element == 'asset')
  const liabilities = balanceSheetAccounts.filter(account => account.element == 'liability')
  const capitals = balanceSheetAccounts.filter(account => account.element == 'capital')

  return {
    body: { accounts, assets, liabilities, capitals }
  }

}