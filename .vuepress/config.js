module.exports = {
  title: "Patient file",
  description: "Big picture, server side and client side doc",
  patterns: ["!**/**/node_modules", "**/*.md", "**/*.vue"],
  themeConfig: {
    sidebar: [
      {
        title: "Home", // required
        path: "/", // optional, link of the title, which should be an absolute path and must exist
        collapsable: true, // optional, defaults to true
        sidebarDepth: 1, // optional, defaults to 1
      },
      {
        title: "Big picture", // required
        path: "/docs/", // optional, link of the title, which should be an absolute path and must exist
        collapsable: true, // optional, defaults to true
        sidebarDepth: 1, // optional, defaults to 1
      },
    ],
  },
};
