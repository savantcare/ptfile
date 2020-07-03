module.exports = {
  title: "Patient file",
  description: "Big picture, server side and client side doc",

  evergreen: true, // Only support latest browser Ref: https://vuepress.vuejs.org/config/#evergreen

  /* Two consecutive asterisks ** in patterns matched against full pathname may have special meaning:
      A leading ** followed by a slash means match in all directories. For example, **slashfoo matches file or directory foo anywhere, the same as pattern foo. **slashfoo/bar matches file or directory bar anywhere that is directly under directory foo.
    A trailing /** matches everything inside. For example, abc/** matches all files inside directory abc, relative to the location of the .gitignore file, with infinite depth.
    Ref: https://stackoverflow.com/questions/29820791/git-ignore-node-modules-folder-everywhere
  */
  patterns: [
    "!(**/node_modules/**)",
    "**/*.md",
    "!.vuepress",
    "!node_modules",
    "!.*",
  ],
  plugins: ["tabs"],
  themeConfig: {
    sidebar: [
      {
        title: "Home", // required
        path: "/", // optional, link of the title, which should be an absolute path and must exist
        collapsable: true, // optional, defaults to true
        sidebarDepth: 1, // optional, defaults to 1
        children: [
          {
            path: "/faq",
            title: "FAQ",
          },
        ],
      },
      {
        title: "Big picture",
        path: "/big-picture/",
        collapsable: true,
        sidebarDepth: 2,
        // How to do nested sidebar? https://github.com/vuejs/vuepress/issues/287#issuecomment-480805333
        children: [
          {
            path: "/big-picture/ui/",
            title: "UI",
            children: [
              {
                path: "/big-picture/ui/why",
                title: "Why",
              },
              {
                path: "/big-picture/ui/what",
                title: "What",
              },
            ],
          },
          {
            path: "/big-picture/tech/",
            title: "Tech",
            children: [
              {
                path: "/big-picture/tech/why",
                title: "Why",
              },
              {
                path: "/big-picture/tech/what",
                title: "What",
              },
              {
                path: "/big-picture/tech/how",
                title: "How",
              },
            ],
          },
        ],
      },
      {
        title: "Server",
        path: "/ptserver/",
        collapsable: true,
        sidebarDepth: 1,
      },
      {
        title: "Client",
        path: "/ptclient/",
        collapsable: true,
        sidebarDepth: 0,
        children: [
          {
            path: "/ptclient/store/",
            title: "vuex-orm",
          },
          {
            path: "/ptclient/components/",
            title: "Components",
            children: [
              {
                path: "/ptclient/components/allergies/",
                title: "Allergies",
                children: [
                  {
                    path: "/ptclient/components/allergies/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/bm/",
                title: "Body measurements",
                children: [
                  {
                    path: "/ptclient/components/bm/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/contacts/",
                title: "Contacts",
                children: [
                  {
                    path: "/ptclient/components/contacts/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/dx/",
                title: "Diagnosis",
                children: [
                  {
                    path: "/ptclient/components/dx/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/documents/",
                title: "Documents",
                children: [
                  {
                    path: "/ptclient/components/documents/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/family-history/",
                title: "Family history",
                children: [
                  {
                    path: "/ptclient/components/family-history/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/medications/",
                title: "Medication",
                children: [
                  {
                    path: "/ptclient/components/medications/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/mental-status-exam/",
                title: "Mental status exam",
                children: [
                  {
                    path:
                      "/ptclient/components/mental-status-exam/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/pharmacy/",
                title: "Pharmacy",
                children: [
                  {
                    path: "/ptclient/components/pharmacy/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/psych-review-of-systems/",
                title: "Psych review of systems",
                children: [
                  {
                    path:
                      "/ptclient/components/psych-review-of-systems/design/design",
                    title: "Design",
                  },
                ],
              },
              {
                path: "/ptclient/components/rex/",
                title: "Recommendations",
              },
              {
                path: "/ptclient/components/scr/",
                title: "Screening",
                children: [
                  {
                    path: "/ptclient/components/scr/design/design",
                    title: "Design",
                  },
                ],
              },
            ],
          },
          {
            path: "/ptclient/faq",
            title: "FAQ",
            sidebarDepth: 0,
          },
        ],
      },
      {
        title: "Glossary",
        path: "/GLOSSARY",
      },
    ],
  },
  markdown: {
    extendMarkdown: (md) => {
      var Plugin = require("markdown-it-regexp");

      const elLinker = Plugin(/:(el):/, (match, utils) => {
        return `<a href="https://element.eleme.io/#/en-US" target="_blank">${match[1]}</a>`;
      });
      const dialogLinker = Plugin(/:(dialog):/, (match, utils) => {
        return `<a href="https://element.eleme.io/#/en-US/component/dialog#dialog" target="_blank">${match[1]}</a>`;
      });
      const tabsLinker = Plugin(/:(tabs):/, (match, utils) => {
        return `<a href="https://element.eleme.io/#/en-US/component/tabs#tabs" target="_blank">${match[1]}</a>`;
      });
      const tabpaneLinker = Plugin(/:(tab-pane):/, (match, utils) => {
        return `<a href="https://element.eleme.io/#/en-US/component/tabs#tabs" target="_blank">${match[1]}</a>`;
      });
      const ctLinker = Plugin(/:(Component):/, (match, utils) => {
        return `<a href="/index.vue" target="_blank">${match[1]}</a>`;
      });
      md.use(elLinker);
      md.use(dialogLinker);
      md.use(tabsLinker);
      md.use(tabpaneLinker);
      md.use(ctLinker);
      md.use(require("markdown-it-vuese"), {
        /* options */
      });
    },
  },
};
