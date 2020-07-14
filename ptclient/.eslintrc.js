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
  // add your custom rules here
  rules: {
    'no-console': 'off', // stop showing console warning
    'no-irregular-whitespace': 'off', // stop showing white space warning
    'vue/no-template-shadow': 'off', // stop showing template shadow warning
    'vue/no-v-html': 'off', // stop showing v-html warning
    'vue/require-prop-types': 'off', // stop showing pro types warning
  },
}
