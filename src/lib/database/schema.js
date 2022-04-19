import * as yup from 'yup'

yup.setLocale({
  mixed: {
    'required': 'Required'
  }
})

yup.addMethod(yup.mixed, 'ne', function () {
  return this.transform(value => {
    if (value == '' || value == "") return undefined
    return value
  })
})

export const extractYupErrors = err => {
  return err.inner.reduce((acc, err) => {
    return { ...acc, [err.path]: err.message };
  }, {});
}

// Account
export const accountSchema = yup.object({
  name: yup.string().trim().min(2).max(200).required().ne(),
  category: yup.string().oneOf(['bills', 'banks', 'capitals', 'parties', 'expenses', 'properties', 'sales', 'purchases', 'cash']),
}).noUnknown(true)

// Transaction
export const transactionSchema = yup.object({
  datetime: yup.string().trim().min(2).max(200).required().ne(),
  narration: yup.string().trim().min(2).max(200).required().ne(),
  lines: yup.array().of(yup.object({
    account_id: yup.string().required(),
    debit: yup.string().required(),
    credit: yup.string().required(),
  }))
}).noUnknown(true)