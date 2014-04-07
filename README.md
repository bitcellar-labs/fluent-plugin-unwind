fluent-plugin-unwind
====================

Synopsis
--------

```
<match app.event_log.purchase>
  type unwind
  output_tag app.unwind_event_log.purchase
  unwind_key item_id
</match>

<match app.unwind_event_log.purchase>
  type stdout
</match>
```

This rules will be applived like below:

```
{ "user_id": 1, "item_id": [ 100, 101, 102 ] }
```

will be extracted to

```
{ "user_id": 1, "item_id": 100 }
{ "user_id": 1, "item_id": 101 }
{ "user_id": 1, "item_id": 102 }
```

Installation
------------

Add this line to your application's Gemfile

```
gem 'fluent-plugin-rewind'
```

Copyright
---------

Copyright (C) 2014 Bitcellar, Inc. / Sho SAWADA

License
-------

MIT License
