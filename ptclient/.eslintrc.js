module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
  },
  parserOptions: {
    parser: 'babel-eslint',
  },
  extends: [
    '@nuxtjs',
    'prettier',
    'prettier/vue',
    'plugin:prettier/recommended',
    'plugin:nuxt/recommended',
  ],
  plugins: ['prettier'],
  // add custom rules here
  rules: {
    /*
      Q) Why needed? 
      - before every build eslint loader check all files and return format errors and warnings (eg:  no-console, whitspace ...) in console and console look show dirty.
      ** this config by passing below mention warning from dev enviroment
    */
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off', // stop showing console warning from development enviroment
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off', // stop showing debugger warning from development enviroment
  },
}
