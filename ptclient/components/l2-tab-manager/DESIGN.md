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

The goal is:

<<< @/ptclient/components/l2-tab-manager/index.vue#goal{1}

To achive the above goal the code is:

<<< @/ptclient/components/l2-tab-manager/index.vue#template{2}

<[vuese](@/ptclient/components/l2-tab-manager/index.vue)
