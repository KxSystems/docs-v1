## <i class="fa fa-mortar-board"></i> Basics

* [Get started](learn)
* [Frequently-asked questions](cookbook/faq)
* [Frequently-asked questions](cookbook/faq-listbox/)from the listbox
* [Client-server programming](cookbook/client-server)
* [Customising the q webserver](cookbook/custom-web/)
* [Daemonizing q on Linux](cookbook/daemon)
* [Performance tips](cookbook/performance-tips)
* [Programming examples](cookbook/programming-examples)
* [Programming idioms](cookbook/programming-idioms)
* [Reporting bugs in Kx products](about/kxtechnology/#reporting-bugs-in-kx-products)
* [Running q as a service on Windows](cookbook/windows-service)
* [More about tables](tutorials/dictsandtables/)
* [Unit tests](cookbook/unit-tests)
* [Using disk logging](cookbook/logging)


## <i class="fa fa-map-o"></i> Technical white papers

* [Efficient use of **adverbs**](wp/efficient_use_of_adverbs.pdf)
* [Streaming **analytics**: detecting card counters in Blackjack](wp/card-counters-in-blackjack.pdf)
* [Kdb+ in **astronomy**](wp/kdb_in_astronomy.pdf)
* [**C API** for kdb+](wp/c_api_for_kdb.pdf)
* [**Compression** in kdb+](wp/compression_in_kdb.pdf)
* [Temporal Data: a kdb+ framework for **corporate actions**](wp/temporal_data_a_kdb_framework_for_corporate_actions.pdf)
* [Kdb+ **data-management sample customisation** techniques](wp/kdb_data_management_sample_customisation_techniques_with_amendments.pdf)
* [**Data recovery** for kdb+tick](wp/data_recovery_for_kdb_tick.pdf)
* [A natural query interface for **distributed systems**](wp/a_natural_query_interface_for_distributed_systems.pdf)
* [Kdb+ and **FIX** messaging](wp/kdb_and_fix_messaging.pdf)
* [The application of **foreign keys** and linked columns in kdb+](wp/the_application_of_foreign_keys_and_linked_columns_in_kdb.pdf)
* [Common design principles for kdb+ **gateways**](wp/common_design_principles_for_kdb_gateways.pdf)
* [An introduction to **graphical interfaces** for kdb+ using C#](wp/an_introduction_to_graphical_interfaces_for_kdb_using_csharp.pdf)
* [Order Book: a kdb+ **intraday storage and access** methodology](wp/order_book_a_kdb_intraday_storage_and_access_methodology.pdf)
* [**Intraday writedown** solutions](wp/intraday_writedown_solutions.pdf)
* [Sample aggregation engine for **market depth**](wp/sample_aggregation_engine_for_market_depth.pdf)
* [Market Fragmentation: a kdb+ framework for **multiple liquidity sources**](wp/market_fragmentation_a_kdb_framework_for_multiple_liquidity_sources.pdf)
* [**Multi-partitioned** kdb+ databases: an equity options case study](wp/multi_partitioned_kdb_databases_an_equity_options_case_study.pdf)
* [**Multi-threading** in kdb+ performance optimisations and use cases](wp/multi_threading_in_kdb_performance_optimisations_and_use_cases.pdf)
* [An introduction to **neural networks** with kdb+](wp/an_introduction_to_neural_networks_with_kdb.pdf)
* [**Parse trees** and functional forms](wp/parse_trees_and_functional_forms.pdf)
* [**Permissions** with kdb+](wp/permissions_with_kdb.pdf)
* [Columnar database and **query optimization**](wp/columnar_database_and_query_optimization.pdf)
* [Kdb+ **query scaling**](wp/kdb_query_scaling.pdf)
* [Building **real-time tick subscribers**](wp/building_real_time_tick_subscribers.pdf)
* [Query Routing: a kdb+ framework for a **scalable load-balanced** system](wp/query_routing_a_kdb_framework_for_a_scalable_load_balanced_system.pdf)
* [**Surveillance** techniques to effectively monitor algo and high-frequency trading](wp/surveillance_techniques_to_effectively_monitor_algo_and_high_frequency_trading.pdf)
* [Kdb+tick profiling for **throughput optimization**](wp/kdbtick_profiling_for_throughput_optimization.pdf)
* [**Time series simplification** in kdb+: a method for dynamically shrinking big data](wp/time_series_simplification_in_kdb_a_method_for_dynamically_shrinking_big_data.pdf)
* [**Transaction-cost** analysis using kdb+](wp/transaction_cost_analysis_using_kdb.pdf)
* [Kdb+ and **WebSockets**](wp/kdb_and_websockets.pdf)

These whitepapers originally appeared as the _q for Gods_ series of white papers from [First Derivatives](http://firstderivatives.com).




## <i class="fa fa-database"></i> Big data

* [Changing the schema of a splayed table](cookbook/splayed-schema-change/)
* [Database partitioning with par.txt](ref/unclassified/#partxt)
* [A load-balancing server](cookbook/load-balancing)
* [Loading and exporting with bcp](cookbook/bcp)
* [Loading large CSV files](cookbook/loading-from-large-files)
* [Splayed tables](cookbook/splayed-tables)
* [Splaying large CSV files](cookbook/splaying-large-files)
* [Temporal data](cookbook/temporal-data)


## <i class="fa fa-sitemap"></i> Tick

* [Publish and subscribe](cookbook/publish-subscribe)
* [Different ways of working with kdb+tick](cookbook/kdb-tick/)
* [Chained tickerplant and RDB for kdb+tick](cookbook/chained-tickerplant/)
* [Write-only alternative to RDB for kdb+tick](cookbook/w-q)
* [Alternative in-memory layouts](cookbook/alternative-in-memory-layouts/)
* <i class="fa fa-github"></i> [KxSystems/kdb/tick](https://github.com/KxSystems/kdb/tree/master/tick) Utility scripts and example schemas (some examples may need to change time types to timespan)


## <i class="fa fa-map-o"></i> How-tos

* [Callbacks in q](cookbook/callbacks)
* [Float precision and equality](cookbook/precision)
* [Linking columns](cookbook/linking-columns)


## <i class="fa fa-exchange"></i> Interprocess communication

* [IPC in a nutshell](cookbook/ipc)
* [The C IPC interface](/interfaces/c-client-for-q/#connecting-to-a-q-server)
* [Async callbacks](cookbook/callbacks)
* [`hopen` examples](ref/filewords/#hopen)
* [IPC protocol and message format](/ref/ipc)
* [_Q for Mortals_ IPC](http://code.kx.com/q4m3/11_IO/#116-interprocess-communication)
* [Server calling the client](cookbook/server-calling-client/)
* [Using Modified `.z` functions to trace, monitor and control execution](cookbook/using-dotz)

<!-- 
## <i class="fa fa-github"></i> Q on GitHub 

* [KxSystems/cookbook](https://github.com/KxSystems/cookbook) – companion files for articles in the q cookbook
* [KxSystems/kdb](https://github.com/KxSystems/kdb)
* [KxSystems/kdb-taq](https://github.com/KxSystems/kdb-taq)
* [KxSystems/kdb-tick](https://github.com/KxSystems/kdb-tick)
* [KxSystems/docs](https://github.com/KxSystems/docs) – source for this documentation site
* [log4q](https://github.com/prodrive11/q_stuff/tree/master/src/log4q)
* [User repositories](https://kxsystems.github.io/)
 -->

## <i class="fa fa-wrench"></i> Utilities

* [Babel for kdb+](http://github.com/CharlesSkelton/babel) <i class="fa fa-github"></i> 
* [Compacting HDB sym enum files](cookbook/compacting-hdb-sym)
* [Using modified `.z` functions](cookbook/using-dotz)
* [Q by examples](tutorials/q-by-examples)
* [Studio for kdb+](http://github.com/CharlesSkelton/studio) <i class="fa fa-github"></i> 
* [User-contributed code](http://kxsystems.github.io/)


## <i class="fa fa-map-o"></i> Miscellaneous

* [Authentication and access control](cookbook/authentication)
* [Bloomberg feed handler](interfaces/q-client-for-bloomberg)
* [Comparison tolerance](cookbook/precision/#comparison-tolerance)
* [Corporate actions](cookbook/corporate-actions)
* [File compression](cookbook/file-compression)
* [Firewalling notes](cookbook/firewalling) (before running q on the Internet)
* [Geospatial](cookbook/geospatial)
* [Q under inetd/xinetd](cookbook/inetd)
* [Linux production notes](cookbook/linux-production/)
* [Multithreaded input mode](/cookbook/multithreaded-input/)
* [Named pipes](cookbook/named-pipes)
* [Password security](https://github.com/johnanthonyludlow/kdb/blob/master/docs/password_security.pdf) <i class="fa fa-github"></i>
* [Regular Expressions (regex)](cookbook/regex)
* [Secure Sockets Layer (SSL</td><td>/ Transport Layer Security (TLS)](cookbook/ssl/)
* [Timezones and daylight saving time](cookbook/timezones)
* [Unicode](cookbook/unicode)


## <i class="fa fa-calendar"></i> Versions – new features
<table>
    <tr><td>[3.5](/ref/releases/ChangesIn3.5)</td><td>2017.03.15</td></tr>
    <tr><td>[3.4](/ref/releases/ChangesIn3.4)</td><td>2016.05.31</td></tr>
    <tr><td>[3.3](/ref/releases/ChangesIn3.3)</td><td>2015.06.01</td></tr>
    <tr><td>[3.2](/ref/releases/ChangesIn3.2)</td><td>2014.08.22</td></tr>
    <tr><td>[3.1](/ref/releases/ChangesIn3.1)</td><td>2013.06.09</td></tr>
    <tr><td>[3.0](/ref/releases/ChangesIn3.0)</td><td>2012.05.29</td></tr>
    <tr><td>[2.8](/ref/releases/ChangesIn2.8)</td><td>2011.11.21</td></tr>
    <tr><td>[2.7](/ref/releases/ChangesIn2.7)</td><td>2010.08.05</td></tr>
    <tr><td>[2.6](/ref/releases/ChangesIn2.6)</td><td>2009.09.15</td></tr>
    <tr><td>[2.5](/ref/releases/ChangesIn2.5)</td><td>2008.12.15</td></tr>
    <tr><td>[2.4](/ref/releases/ChangesIn2.4)</td></tr>
</table>

Full change list at [downloads.kx.com](http://downloads.kx.com)
