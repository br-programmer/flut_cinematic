import 'package:flutter/material.dart';

extension WidgetX on Widget {
  SliverToBoxAdapter get toSliver => SliverToBoxAdapter(child: this);
}
