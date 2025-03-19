import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/citizen_cubit/citizen_cubit.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/imsakiyah_cubit/imsakiyah_cubit.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/region_cubit/region_cubit.dart';
import 'package:imsakiyah_mobile/cores/components/container.dart';
import 'package:imsakiyah_mobile/cores/constants/colors_cons.dart';
import 'package:imsakiyah_mobile/cores/models/add_imsakiyah.dart';
import 'package:imsakiyah_mobile/cores/models/add_kabupaten.dart';
import 'package:imsakiyah_mobile/presentations/home/controller/home_page_controller.dart';
import 'package:imsakiyah_mobile/widgets/common_dropdown.dart';
import 'package:imsakiyah_mobile/widgets/common_textfield.dart';
import 'package:imsakiyah_mobile/widgets/common_textstyle.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  Widget build(BuildContext context, HomePageController controller) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: CommonText(
          text: 'Jadwal Imsakiyah',
          color: darkgrey,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: white,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: CommonText(
              text: 'Cahyonoz Dev',
              color: black,
            ),
          ).paddedLTRB(bottom: 10, right: 10),
          SingleChildScrollView(
            child: Column(
              children: [
                const CommonText(
                  text: '',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: black,
                ),
                BlocBuilder<RegionCubit, RegionState>(
                  builder: (context, state) {
                    return state.when(
                        initial: () => SkeletonAnimation(
                                child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: greyTwo),
                            )),
                        error: (message) => CommonTextField(
                              readOnly: true,
                              fillColor: blackTwo,
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 16.0,
                              ),
                              filled: true,
                              hintText: message,
                              textInputType: TextInputType.text,
                            ),
                        success: (region) => region?.data == null
                            ? const SizedBox()
                            : CommonDropDown(
                                dropDownColor: white,
                                hintText: 'Pilih Provinci',
                                validatorText: 'provinsi can\t be empty!',
                                value: controller.reg.value,
                                items: region?.data?.map((e) {
                                  return DropdownMenuItem(
                                      value: e,
                                      child: CommonText(
                                        text: e,
                                        color: greyLight,
                                      ));
                                }).toList(),
                                onChange: (value) {
                                  controller.reg.value = value;
                                  controller.city.value == null;
                                  context.read<CitizenCubit>().getCity(
                                      AddKabupaten(
                                          provinsi: controller.reg.value),
                                      context);
                                }).topPadded(5));
                  },
                ).bottomPadded12(),
                BlocBuilder<CitizenCubit, CitizenState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const CommonTextField(
                        hintText: 'Pilih Provinsi terlebih dahulu',
                        textInputType: TextInputType.text,
                        readOnly: true,
                        fillColor: greyTwo,
                        filled: true,
                      ),
                      error: (message) => CommonTextField(
                        readOnly: true,
                        fillColor: blackTwo,
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 16.0,
                        ),
                        filled: true,
                        hintText: message,
                        textInputType: TextInputType.text,
                      ),
                      success: (city) => Column(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: controller.city,
                            builder: (context, value, child) => CommonDropDown(
                                dropDownColor: white,
                                hintText: 'Pilih Kabupaten',
                                validatorText: 'provinsi can\t be empty!',
                                value: value == null ? value : null,
                                items: city?.data?.map((e) {
                                  return DropdownMenuItem(
                                      value: e,
                                      child: CommonText(
                                        text: e,
                                        color: greyLight,
                                      ));
                                }).toList(),
                                onChange: (value) {
                                  controller.city.value = value;
                                  if (value != null) {
                                    context.read<ImsakiyahCubit>().getImsakiyah(
                                        AddImsakiyah(
                                            provinsi: controller.reg.value,
                                            kabkota: controller.city.value),
                                        context);
                                  }
                                }).topPadded(5).bottomPadded8(),
                          ),
                          ValueListenableBuilder(
                              valueListenable: controller.city,
                              builder: (context, value, child) => value == null
                                  ? const SizedBox()
                                  : BlocBuilder<ImsakiyahCubit, ImsakiyahState>(
                                      builder: (context, state) {
                                      return state.when(
                                        initial: () => SkeletonAnimation(
                                            child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: greyTwo),
                                        )),
                                        error: (message) => Center(
                                          child: CommonText(text: message),
                                        ),
                                        success: (imsakiyah) =>
                                            ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: imsakiyah?.data?.length,
                                          itemBuilder: (context, index) {
                                            final imsakiya =
                                                imsakiyah?.data?[index];
                                            return Column(
                                              children: [
                                                CommonText(
                                                  text:
                                                      '${imsakiya?.kabkota} | ${imsakiya?.masehi} M /${imsakiya?.hijriah} H',
                                                  color: black,
                                                ).bottomPadded12(),
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CommonText(
                                                      text: 'Tanggal',
                                                      fontSize: 12,
                                                      textAlign:
                                                          TextAlign.start,
                                                      color: black,
                                                    ),
                                                    CommonText(
                                                      text: 'Imsak',
                                                      fontSize: 12,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: black,
                                                    ),
                                                    CommonText(
                                                      text: 'Shubuh',
                                                      fontSize: 12,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: black,
                                                    ),
                                                    CommonText(
                                                      text: 'Dhuha',
                                                      fontSize: 12,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: black,
                                                    ),
                                                    CommonText(
                                                      text: 'Dzuhur',
                                                      fontSize: 12,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: black,
                                                    ),
                                                    CommonText(
                                                      text: '\'Asar',
                                                      fontSize: 12,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: black,
                                                    ),
                                                    CommonText(
                                                      text: 'Magrib',
                                                      fontSize: 12,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: black,
                                                    ),
                                                    CommonText(
                                                      text: '\'Isya',
                                                      fontSize: 12,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: black,
                                                    ),
                                                  ],
                                                )
                                                    .rightPadded20()
                                                    .bottomPadded6(),
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: imsakiya
                                                      ?.imsakiyah?.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final prayer = imsakiya
                                                        ?.imsakiyah?[index];
                                                    return Table(
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      children: [
                                                        TableRow(children: [
                                                          CommonText(
                                                            text:
                                                                '${prayer?.tanggal}',
                                                            color: black,
                                                          ),
                                                          CommonText(
                                                            text:
                                                                '${prayer?.imsak}',
                                                            color: black,
                                                          ),
                                                          CommonText(
                                                            text:
                                                                '${prayer?.subuh}',
                                                            color: black,
                                                          ),
                                                          CommonText(
                                                            text:
                                                                '${prayer?.dhuha}',
                                                            color: black,
                                                          ),
                                                          CommonText(
                                                            text:
                                                                '${prayer?.dzuhur}',
                                                            color: black,
                                                          ),
                                                          CommonText(
                                                            text:
                                                                '${prayer?.ashar}',
                                                            color: black,
                                                          ),
                                                          CommonText(
                                                            text:
                                                                '${prayer?.maghrib}',
                                                            color: black,
                                                          ),
                                                          CommonText(
                                                            text:
                                                                '${prayer?.isya}',
                                                            color: black,
                                                          ),
                                                        ])
                                                      ],
                                                    );
                                                  },
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    })),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ).paddedLTRB(left: 15, right: 15, top: 10),
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => HomePageController();
}
