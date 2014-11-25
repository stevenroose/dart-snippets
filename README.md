dart-snippets
=============

A collection of useful Dart code snippets. Each of them are defined in a separate library and can be imported separately.

[ByteSink](https://github.com/stevenroose/dart-snippets/blob/master/lib/byte_sink.dart)
--------
A ByteSink implementation that implements the dart:core Sink interface. 
It supports adding single and multiple bytes (both List<int> as TypedData classes like Uint8List) and can be extracted as a Uint8List byte string.

[LRUMap](https://github.com/stevenroose/dart-snippets/blob/master/lib/lru_map.dart)
------
An implementation of a Map which has a maximum size and uses a Least Recently Used algorithm to remove items from the map when the maximum size is reached and new items are added.
