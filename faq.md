# How was documentation system installed?

```bash
yarn init

yarn add -D vuepress

echo '# Hello VuePress' > README.md

yarn docs:dev
```

# Why is vue-press in parent folder of ptclient and ptserver?

vuepress cannot refer to files in parent folders. This vuepress will be used to document both client and server.
