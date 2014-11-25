library stevenroose.lru_map;

import "dart:collection";


/**
 * An implementation of a Map which has a maximum size and uses a Least Recently Used algorithm
 * to remove items from the Map when the maximum size is reached and new items are added.
 *
 * It is possible to provide a method that will be called whenever the LRU element is removed from the map.
 */
@proxy
class LRUMap<K,V> implements Map<K,V> {

  final int capacity;
  final Function onLRURemoved;
  final LinkedHashMap _map;

  /**
   * Create a new LRUMap.
   *
   * [capacity] is the maximum capacity of the map and defaults to 100.
   * If [onLRURemoved] is provided, the function will be called whenever a new element is added and the map
   * is at maximum capacity. The function will be called with the key and value of the least-recently-used entry.
   */
  LRUMap({int this.capacity: 100, Function this.onLRURemoved}) : _map = new LinkedHashMap<K,V>();

  @override
  V operator [](K key) {
    if(!_map.containsKey(key))
      return null;
    V value = _map.remove(key);
    _map[key] = value;
    return value;
  }

  @override
  operator []=(K key, V value) {
    if(_map.length >= capacity && !_map.containsKey(key))
      _removeLRU();
    _map.remove(key);
    return _map[key] = value;
  }

  void _removeLRU() {
    K key = _map.keys.first;
    V value = _map.remove(key);
    if(onLRURemoved != null)
      onLRURemoved(key, value);
  }

  @override
  noSuchMethod(Invocation inv) => reflect(_map).delegate(inv);
}