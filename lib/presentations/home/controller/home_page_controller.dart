import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/citizen_cubit/citizen_cubit.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/imsakiyah_cubit/imsakiyah_cubit.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/region_cubit/region_cubit.dart';
import 'package:imsakiyah_mobile/cores/models/add_imsakiyah.dart';
import 'package:imsakiyah_mobile/cores/models/add_kabupaten.dart';
import 'package:imsakiyah_mobile/presentations/home/views/home_page_view.dart';

class HomePageController extends State<HomePageView> {
  final ValueNotifier reg = ValueNotifier(null);
  final ValueNotifier city = ValueNotifier(null);

  RegionCubit regionCubit = RegionCubit();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String? town;

  getImsakiyah() {
    context.read<ImsakiyahCubit>().getImsakiyah(
        AddImsakiyah(provinsi: reg.value, kabkota: city.value), context);
    isLoading = true;
    setState(() {});
  }

  getCity() {
    context
        .read<CitizenCubit>()
        .getCity(AddKabupaten(provinsi: reg.value), context);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    regionCubit = context.read<RegionCubit>()..listRegion(context);
    super.initState();
  }
}
