module.exports = {
  title: "Patient file documentation",
  description: "Just playing around",
  themeConfig: {
    sidebar: [
      {
        title: "Home", // required
        path: "/", // optional, link of the title, which should be an absolute path and must exist
        collapsable: true, // optional, defaults to true
        sidebarDepth: 1, // optional, defaults to 1
      },
      {
        title: "Tech", // required
        path: "/tech/", // optional, link of the title, which should be an absolute path and must exist
        collapsable: true, // optional, defaults to true
        sidebarDepth: 1, // optional, defaults to 1
        children: [
          ["/tech/why", "Why"],
          ["/tech/what", "What"],
          ["/tech/howto", "How"],
        ],
      },
      {
        title: "UI",
        path: "/ui/", // optional, link of the title, which should be an absolute path and must exist
        collapsable: true, // optional, defaults to true
        sidebarDepth: 1, // optional, defaults to 1
        children: [
          ["/ui/why", "Why"],
          ["/ui/what", "What"],
        ],
      },
      {
        title: "Todo",
        path: "todo", // optional, link of the title, which should be an absolute path and must exist
        collapsable: false, // optional, defaults to true
        sidebarDepth: 1, // optional, defaults to 1
      },
    ],
  },
  plugins: [
    [
      "component-docgen",
      {
        rootDir: "/Users/vk-tech/gt/sc-prog-repos/ptclient/cts/",
      },
    ],
  ],
};
