import { dev } from '$app/env';
import dayjs from 'dayjs';
import redaxios from 'redaxios'

export const axios = redaxios.create({
  withCredentials: true,
})

export const internalError = error => {
  if (dev) console.log(error)
  return {
    status: 500, body: { message: 'Error from our side. We apologize' }
  }
}

export const beautifyDateTime = (ISO8601 = '') => {
  return dayjs(ISO8601).format('DD MMM, YYYY HH:mm:ss')
}

export const beautifyDate = (ISO8601 = '') => {
  return dayjs(ISO8601).format('DD MMM, YYYY')
}

export const getOtherQueryParams = (items = [], pg, opts = { start: false }) => {
  if (items.length == 0) return ''
  let result = ''
  items = items.filter(el => pg.url.searchParams.get(el))
  for (const [index, item] of items.entries()) {
    let value = pg.url.searchParams.get(item) || ''
    if (opts.start && index == 0) {
      result += '?' + item + '=' + value + (+index+1 == items.length ? '' : '&')
    } else {
      result += '&' + item + '=' + value + (+index+1 == items.length ? '' : '&')
    }
  }
  return result
}

export const capitalize = sentence => {
  const words = sentence.split(" ");
  for (let i = 0; i < words.length; i++) {
      words[i] = words[i][0].toUpperCase() + words[i].substr(1);
  }
  return words.join(" ");
}