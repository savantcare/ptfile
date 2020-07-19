# Components

[[toc]]

## How to write a component

3 core concepts:

1. The entrance file is: [searchInterface.vue](https://github.com/savantcare/ptfile/blob/master/ptclient/cts/spi/rem/search-interfaces.vue)

2. Each component will usually have sub components for [vl](https://github.com/savantcare/ptfile/tree/master/ptclient/cts/spi/rem/vl) and [cl](https://github.com/savantcare/ptfile/tree/master/ptclient/cts/spi/rem/cl)

3. Data in a component is measured through a [model](https://github.com/savantcare/ptfile/blob/master/ptclient/cts/spi/rem/db/vuex-orm/rem.js)

## Types of component

### Core components

| #   | Name                                      | Programmer | Status       |
| --- | ----------------------------------------- | ---------- | ------------ |
| 1   | [L2 tab manager](./core/cl-tabs-manager/) | Vikas      | Ready to use |

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
