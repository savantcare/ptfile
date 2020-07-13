[[toc]]

## Section 1: Graphical representation of end product

<<< @/ptclient/cts/core/cl-tabs-manager/DESIGN.md

## Section 2: Feature to code relationship

| #   | Feature                | Client side state                 | Server side state | Component                          | Client side code                                                                                                                                                                      | Server side code |
| --- | ---------------------- | --------------------------------- | ----------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| 1   | Dialog containing tabs | vblIsdialogHoldingTabsInCLVisible | None              | ctShowAddAndRemoveTabsInDialog.vue | [Dialog containing tabs](https://github.com/savantcare/ptfile/blob/3e5abdae677e3621559b65ee9bc33544ceb103b3/ptclient/cts/core/cl-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue#L20) | None             |
| 2   | Add a tab              | arTabs                            | None              | ctSearchToAddTabInCL.vue           | [Add a tab](https://github.com/savantcare/ptfile/blob/3e5abdae677e3621559b65ee9bc33544ceb103b3/ptclient/cts/core/cl-tabs-manager/ctSearchToAddTabInCL.vue)                            | None             |
| 3   | Remove a tab           | same as 2                         | None              | same as 1                          | [Remove a tab](https://github.com/savantcare/ptfile/blob/3e5abdae677e3621559b65ee9bc33544ceb103b3/ptclient/cts/core/cl-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue#L188)          | None             |
| 4   | KB interaction         | vsSelectedTabId                   | None              | same as 1                          | [KB interaction](https://github.com/savantcare/ptfile/blob/3e5abdae677e3621559b65ee9bc33544ceb103b3/ptclient/cts/core/cl-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue#L121)        | None             |
| 5   | Set of tabs            | same as 2                         | None              | ctSetOfTabs.vue                    | [Set of tabs](https://github.com/savantcare/ptfile/tree/master/ptclient/cts/core/cl-tabs-manager/ctSetOfTabs.vue)                                                                     | None             |
