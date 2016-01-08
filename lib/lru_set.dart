library stevenroose.lru_set;

import "dart:collection";

import "package:zengen/zengen.dart";

part "src/lru_set.g.dart";


/**
 * An implementation of a Set which has a maximum size and uses a Least Recently Used algorithm
 * to remove items from the Set when the maximum size is reached and new items are added.
 *
 * It is possible to provide a method that will be called whenever the LRU element is removed from the set.
 */
class _LRUSet<V> { // implements Set<V> {

  final int capacity;
  final Function onLRURemoved;

  @Delegate()
  final Set<V> _set;

  /**
   * Create a new LRUSet.
   *
   * [capacity] is the maximum capacity of the set and defaults to 100.
   * If [onLRURemoved] is provided, the function will be called whenever the least-recently-used entry
   * is removed from the set. It will be called with the key and value of this entry as parameters.
   */
  _LRUSet({int this.capacity: 100, Function this.onLRURemoved}) : _set = new LinkedHashSet<V>();

  void _removeLRU() {
    K key = _set.keys.first;
    V value = _set.remove(key);
    if(onLRURemoved != null)
      onLRURemoved(key, value);
  }
}