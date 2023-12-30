import 'package:collection/collection.dart' show DelegatingList;
import 'package:equatable/equatable.dart';

class ItemList<E> extends DelegatingList<E>
    with EquatableMixin
    implements List<E> {
  const ItemList(
    super.items, {
    this.hasMore = false,
    this.quotaMax = 0,
    this.quotaRemaining = 0,
  });

  final bool hasMore;
  final int quotaMax;
  final int quotaRemaining;

  factory ItemList.filled(
    int length,
    E fill, {
    bool growable = false,
    bool hasMore = false,
    int quotaMax = 0,
    int quotaRemaining = 0,
  }) =>
      ItemList<E>(
        List<E>.filled(length, fill, growable: growable),
        hasMore: hasMore,
        quotaMax: quotaMax,
        quotaRemaining: quotaRemaining,
      );

  factory ItemList.empty({
    bool growable = false,
    bool hasMore = false,
    int quotaMax = 0,
    int quotaRemaining = 0,
  }) =>
      ItemList<E>(
        List<E>.empty(growable: growable),
        hasMore: hasMore,
        quotaMax: quotaMax,
        quotaRemaining: quotaRemaining,
      );

  factory ItemList.from(
    Iterable<E> elements, {
    bool growable = true,
    bool hasMore = false,
    int quotaMax = 0,
    int quotaRemaining = 0,
  }) =>
      ItemList<E>(
        List<E>.from(elements, growable: growable),
        hasMore: hasMore,
        quotaMax: quotaMax,
        quotaRemaining: quotaRemaining,
      );

  factory ItemList.of(
    Iterable<E> elements, {
    bool growable = true,
    bool hasMore = false,
    int quotaMax = 0,
    int quotaRemaining = 0,
  }) =>
      ItemList<E>(
        List<E>.of(elements, growable: growable),
        hasMore: hasMore,
        quotaMax: quotaMax,
        quotaRemaining: quotaRemaining,
      );

  factory ItemList.generate(
    int length,
    E Function(int index) generator, {
    bool growable = true,
    bool hasMore = false,
    int quotaMax = 0,
    int quotaRemaining = 0,
  }) =>
      ItemList<E>(
        List<E>.generate(length, generator, growable: growable),
        hasMore: hasMore,
        quotaMax: quotaMax,
        quotaRemaining: quotaRemaining,
      );

  factory ItemList.unmodifiable(
    Iterable<E> elements, {
    bool hasMore = false,
    int quotaMax = 0,
    int quotaRemaining = 0,
  }) =>
      ItemList<E>(
        List<E>.unmodifiable(elements),
        hasMore: hasMore,
        quotaMax: quotaMax,
        quotaRemaining: quotaRemaining,
      );

  static void copyRange<E>(
    ItemList<E> target,
    int at,
    ItemList<E> source, [
    int? start,
    int? end,
  ]) =>
      List.copyRange<E>(target, at, source, start, end);

  static void writeIterable<T>(
    ItemList<T> target,
    int at,
    Iterable<T> source,
  ) =>
      List.writeIterable<T>(target, at, source);

  ItemList<E> copyWith({
    List<E>? items,
    bool? hasMore,
    int? quotaMax,
    int? quotaRemaining,
  }) =>
      ItemList<E>(
        items ?? toList(),
        hasMore: hasMore ?? this.hasMore,
        quotaMax: quotaMax ?? this.quotaMax,
        quotaRemaining: quotaRemaining ?? this.quotaRemaining,
      );

  @override
  List<Object?> get props => [
        toList(),
        hasMore,
        quotaMax,
        quotaRemaining,
      ];
}
