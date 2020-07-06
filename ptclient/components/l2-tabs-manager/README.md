[[toc]]

## Section 1: End product

<<< @/ptclient/components/l2-tabs-manager/DESIGN.md

## Section 2: Components

1. [ctSearchToAddTabInL2](https://github.com/savantcare/ptfile/tree/master/ptclient/components/l2-tabs-manager/ctSearchToAddTabInL2.vue)
2. [ctShowAddAndRemoveTabsInDialog](https://github.com/savantcare/ptfile/tree/master/ptclient/components/l2-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue)
3. [ctSetOfTabs](https://github.com/savantcare/ptfile/tree/master/ptclient/components/l2-tabs-manager/ctSetOfTabs.vue)

## Section 3: Storage on server side

None

## Section 4: Storage on client side

<<< @/ptclient/components/l2-tabs-manager/l2DialogAndTabsState.js#state

[l2DialogAndTabsState](https://github.com/savantcare/ptfile/tree/master/ptclient/components/l2-tabs-manager/l2DialogAndTabsState.js)

## Section 5: Operational detail of client side UI design

1. The goal is:

<<< @/ptclient/components/l2-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue#goal{1}

To achive the above goal the code is:

<<< @/ptclient/components/l2-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue#template{2}

2. Keyboard to select tabs

<<< @/ptclient/components/l2-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue#kbselect

<[vuese](@/ptclient/components/l2-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue)

## Section 6: Operational detail of Server side API design

None
