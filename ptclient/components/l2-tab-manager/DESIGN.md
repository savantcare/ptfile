```asciidoc                                                                       ┌───────────────┐
                                                                 ────────────────▶│ Prop: visible │
                                                                 │                └───────────────┘
                                                                 │
                                                           ┌─────┴─────┐
                         ┌─────────────────────────────────┤ el-Dialog ├──────────────────────────────────┐
                         │                                 └───────────┘                                  │
                         │                                                                                │
                         │                                                                                │
┌────────┐               │ ┌───────┐┌───────┐┌───────┐┌───────┐                                           │
│arTabs[]│◀────────────  │ │ Tab 1 ││ Tab 2 ││ Tab 3 ││ Tab 4 │                                           │
└────────┘               │ └────┬──┘└───────┘└───────┘└───────┘                                           │
                         │      │                                                                         │
                         │      │                                                                         │
┌──────────┐             │      │                                                                         │
│vsTabName │◀────────────┼──────                                                                          │
└──────────┘             │                                                                                │
                         │                                                                                │
                         └────────────────────────────────────────────────────────────────────────────────┘
```

Source is at: [https://github.com/savantcare/ptfile/tree/master/ptclient/components/l2-tab-manager](https://github.com/savantcare/ptfile/tree/master/ptclient/components/l2-tab-manager)
