
export default () =>({
  port : parseInt(process.env.PORT),
  at_secret : process.env.AT_SECRET,
  rt_secret : process.env.RT_SECRET,
  at_expiration : process.env.AT_EXPIRATION,
  rt_expiration : process.env.RT_EXPIRATION,
  towfa_secret : process.env.TOWFA_SECRET,
  salt : process.env.SALT,
  google_client_id : process.env.GOOGLE_CLIENT_ID,
  google_client_secret : process.env.GOOGLE_CLIENT_SECRET,
  google_callback_url : process.env.GOOGLE_CALLBACK_URL,
})
