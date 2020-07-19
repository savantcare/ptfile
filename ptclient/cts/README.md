# Components

[[toc]]

## How to write a component

3 core concepts:

1. The entrance file is: [search-interfaces.vue](https://github.com/savantcare/ptfile/blob/master/ptclient/cts/spi/rem/search-interfaces.vue)
   This file comes into the search dropdown by menioning it in 2 places at:
   /Users/vk-tech/gt/sc-prog-repos/ptfile/ptclient/cts/core/vl-search-box/index.vue

2. Each component will usually have sub components for [vl](https://github.com/savantcare/ptfile/tree/master/ptclient/cts/spi/rem/vl) and [cl](https://github.com/savantcare/ptfile/tree/master/ptclient/cts/spi/rem/cl). Terms like [vl](../../GLOSSARY.html#others) and [cl](../../GLOSSARY.html#others) are explained in [glossary](../../GLOSSARY). Which subcomponent is invoked is based on the keys inside [search-interfaces.vue](https://github.com/savantcare/ptfile/blob/master/ptclient/cts/spi/rem/search-interfaces.vue)

3. Data in a component is [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) through a [model](https://github.com/savantcare/ptfile/blob/master/ptclient/cts/spi/rem/db/vuex-orm/rem.js)

## Types of component

### Core components

| #   | Name                                                | Programmer | Status       |
| --- | --------------------------------------------------- | ---------- | ------------ |
| 1   | [Change layer tab manager](./core/cl-tabs-manager/) | Vikas      | Ready to use |

### Health components

| #   | Name                             | Programmer | Status                             |
| --- | -------------------------------- | ---------- | ---------------------------------- |
| 1   | [Recommendations](./spi/rec/)    | Sanjay     | UI and DB final. Feature Under dev |
| 2   | [Goals](./spi/goal/)             | Raj        | UI and DB final. Feature Under dev |
| 3   | [Diagnosis](./spi/dx/)           | Anirban    | UI and DB final. Feature Under dev |
| 4   | [Screening](./spi/scr/)          | Jana       | UI and DB final. Feature Under dev |
| 5   | [Body measurement](./spi/bm/)    | Alexey     | Need to bring to nuxt              |
| 6   | [Mental status exam](./spi/mse/) | Alexey     | Need to bring to nuxt              |
| 7   | [Reminders](./spi/rem/)          |            |                                    |
| 8   | [Medication](./spi/medications/) |            |                                    |

### Other components
