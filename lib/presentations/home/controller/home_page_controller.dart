import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/region_cubit/region_cubit.dart';
import 'package:imsakiyah_mobile/presentations/home/views/home_page_view.dart';

class HomePageController extends State<HomePageView> {
  final ValueNotifier reg = ValueNotifier(null);
  final ValueNotifier city = ValueNotifier(null);

  RegionCubit regionCubit = RegionCubit();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String? town;

  @override
  void initState() {
    regionCubit = context.read<RegionCubit>()..listRegion(context);
    super.initState();
  }
}
