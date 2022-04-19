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

export const getOtherQueryParams = ($page, current) => {

  let result = ''
  const params = Object.fromEntries($page.url.searchParams.entries())

  for (const param in params) {
    if (param == current) continue
    result += '&' + param + '=' + params[param]
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

export const sumIt = (a, b) => +a + +b