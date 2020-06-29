module.exports = {
  title: 'Patient file',
  description: 'Big picture, server side and client side doc',

  evergreen: true, // Only support latest browser Ref: https://vuepress.vuejs.org/config/#evergreen

  /* Two consecutive asterisks ** in patterns matched against full pathname may have special meaning:
      A leading ** followed by a slash means match in all directories. For example, **slashfoo matches file or directory foo anywhere, the same as pattern foo. **slashfoo/bar matches file or directory bar anywhere that is directly under directory foo.
    A trailing /** matches everything inside. For example, abc/** matches all files inside directory abc, relative to the location of the .gitignore file, with infinite depth.
    Ref: https://stackoverflow.com/questions/29820791/git-ignore-node-modules-folder-everywhere
  */
  patterns: [
    '!(**/node_modules/**)',
    '**/*.md',
    '!.vuepress',
    '!node_modules',
    '!.*',
  ],
  plugins: ['vuepress-plugin-glossary'],
  themeConfig: {
    sidebar: [
      {
        title: 'Home', // required
        path: '/', // optional, link of the title, which should be an absolute path and must exist
        collapsable: true, // optional, defaults to true
        sidebarDepth: 1, // optional, defaults to 1
        children: [
          {
            path: '/faq',
            title: 'FAQ',
          },
        ],
      },
      {
        title: 'Big picture',
        path: '/big-picture/',
        collapsable: true,
        sidebarDepth: 2,
        // How to do nested sidebar? https://github.com/vuejs/vuepress/issues/287#issuecomment-480805333
        children: [
          {
            path: '/big-picture/ui/',
            title: 'UI',
            children: [
              {
                path: '/big-picture/ui/why',
                title: 'Why',
              },
              {
                path: '/big-picture/ui/what',
                title: 'What',
              },
            ],
          },
          {
            path: '/big-picture/tech/',
            title: 'Tech',
            children: [
              {
                path: '/big-picture/tech/why',
                title: 'Why',
              },
              {
                path: '/big-picture/tech/what',
                title: 'What',
              },
              {
                path: '/big-picture/tech/how',
                title: 'How',
              },
            ],
          },
        ],
      },
      {
        title: 'Server',
        path: '/ptserver/',
        collapsable: true,
        sidebarDepth: 1,
      },
      {
        title: 'Client',
        path: '/ptclient/',
        collapsable: true,
        sidebarDepth: 1,
        children: [
          {
            path: '/ptclient/store/',
            title: 'vuex-orm',
          },
          {
            path: '/ptclient/components/',
            title: 'Components',
            children: [
              {
                path: '/ptclient/components/allergies/design/design',
                title: 'Allergies',
              },
              {
                path: '/ptclient/components/body-measurements/',
                title: 'Body measurements',
                children: [
                  {
                    path: '/ptclient/components/body-measurements/design/design',
                    title: 'Design',
                  },
                ],
              },
              {
                path: '/ptclient/components/contacts/design/design',
                title: 'Contacts',
              },
              {
                path: '/ptclient/components/documents/design/design',
                title: 'Documents',
              },
              {
                path: '/ptclient/components/family-history/design/design',
                title: 'Family history',
              },
              {
                path: '/ptclient/components/medications/design/design',
                title: 'Medication',
              },
              {
                path: '/ptclient/components/mental-status-exam/design/design',
                title: 'Mental status exam',
              },
              {
                path: '/ptclient/components/pharmacy/design/design',
                title: 'Pharmacy',
              },
              {
                path: '/ptclient/components/psych-review-of-systems/design/design',
                title: 'Psych review of systems',
              },
              {
                path: '/ptclient/components/rex/',
                title: 'Recommendations',
              },
              {
                path: '/ptclient/components/screening/design/design',
                title: 'Screening',
              },
            ],
          },
          {
            path: '/ptclient/faq',
            title: 'FAQ',
          },
        ],
      },
      {
        title: 'Glossary',
        path: '/GLOSSARY',
      },
    ],
  },
}
