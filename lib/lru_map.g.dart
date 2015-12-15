// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-12-15T14:01:46.784Z

part of stevenroose.lru_map;

// **************************************************************************
// Generator: ZengenGenerator
// Target: library stevenroose.lru_map
// **************************************************************************

@GeneratedFrom(_LRUMap)
/**
 * An implementation of a Map which has a maximum size and uses a Least Recently Used algorithm
 * to remove items from the Map when the maximum size is reached and new items are added.
 *
 * It is possible to provide a method that will be called whenever the LRU element is removed from the map.
 */
class LRUMap<K, V> implements Map<K, V> {
  // implements Map<K,V> {

  final int capacity;
  final Function onLRURemoved;

  final Map<K, V> _map;

  /**
   * Create a new LRUMap.
   *
   * [capacity] is the maximum capacity of the map and defaults to 100.
   * If [onLRURemoved] is provided, the function will be called whenever the least-recently-used entry
   * is removed from the map. It will be called with the key and value of this entry as parameters.
   */
  LRUMap({int this.capacity: 100, Function this.onLRURemoved})
      : _map = new LinkedHashMap<K, V>();

  @override
  V operator [](K key) {
    if (!_map.containsKey(key)) return null;
    V value = _map.remove(key);
    _map[key] = value;
    return value;
  }

  @override
  operator []=(K key, V value) {
    if (_map.length >= capacity && !_map.containsKey(key)) _removeLRU();
    _map.remove(key);
    return _map[key] = value;
  }

  void _removeLRU() {
    K key = _map.keys.first;
    V value = _map.remove(key);
    if (onLRURemoved != null) onLRURemoved(key, value);
  }

  void forEach(void f(dynamic key, dynamic value)) {
    _map.forEach(f);
  }

  void clear() {
    _map.clear();
  }

  V remove(Object key) => _map.remove(key);
  void addAll(Map<K, V> other) {
    _map.addAll(other);
  }

  V putIfAbsent(K key, V ifAbsent()) => _map.putIfAbsent(key, ifAbsent);
  bool containsKey(Object key) => _map.containsKey(key);
  bool containsValue(Object value) => _map.containsValue(value);
  bool get isNotEmpty => _map.isNotEmpty;
  bool get isEmpty => _map.isEmpty;
  int get length => _map.length;
  Iterable<V> get values => _map.values;
  Iterable<K> get keys => _map.keys;
}
