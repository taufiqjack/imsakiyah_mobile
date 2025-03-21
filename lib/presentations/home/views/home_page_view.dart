import 'dart:isolate';

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
      appBar: AppBar(
        title: CommonText(
          text: 'Jadwal Imsakiyah',
          color: white,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: CommonText(
              text: 'Cahyonoz Dev',
              color: white,
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
                                  controller.getCity();
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
                                    controller.getImsakiyah();
                                  }
                                }).topPadded(5).bottomPadded8(),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 1.5,
                            child: SingleChildScrollView(
                              child: ValueListenableBuilder(
                                  valueListenable: controller.city,
                                  builder: (context, value, child) => controller
                                              .isLoading ==
                                          false
                                      ? const SizedBox()
                                      : BlocBuilder<ImsakiyahCubit,
                                              ImsakiyahState>(
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  imsakiyah?.data?.length,
                                              itemBuilder: (context, index) {
                                                final imsakiya =
                                                    imsakiyah?.data?[index];
                                                return Column(
                                                  children: [
                                                    CommonText(
                                                      text:
                                                          '${imsakiya?.kabkota} | ${imsakiya?.masehi} M /${imsakiya?.hijriah} H',
                                                    ).bottomPadded12(),
                                                    Table(
                                                      border: TableBorder.all(
                                                          color: white),
                                                      children: [
                                                        TableRow(
                                                          children: [
                                                            CommonText(
                                                              text: 'Tanggal',
                                                              fontSize: 12,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ).topPadded4(),
                                                            CommonText(
                                                              text: 'Imsak',
                                                              fontSize: 12,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ).topPadded4(),
                                                            CommonText(
                                                              text: 'Shubuh',
                                                              fontSize: 12,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ).topPadded4(),
                                                            CommonText(
                                                              text: 'Dhuha',
                                                              fontSize: 12,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ).topPadded4(),
                                                            CommonText(
                                                              text: 'Dzuhur',
                                                              fontSize: 12,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ).topPadded4(),
                                                            CommonText(
                                                              text: '\'Asar',
                                                              fontSize: 12,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ).topPadded4(),
                                                            CommonText(
                                                              text: 'Magrib',
                                                              fontSize: 12,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ).topPadded4(),
                                                            CommonText(
                                                              text: '\'Isya',
                                                              fontSize: 12,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                                .bottomPadded6()
                                                                .topPadded4(),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    ListView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      padding: EdgeInsets.zero,
                                                      itemCount: imsakiya
                                                          ?.imsakiyah?.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final prayer = imsakiya
                                                            ?.imsakiyah?[index];
                                                        return Table(
                                                          border:
                                                              TableBorder.all(
                                                                  color: white),
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          children: [
                                                            TableRow(children: [
                                                              CommonText(
                                                                text:
                                                                    '${prayer?.tanggal}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )
                                                                  .topPadded4()
                                                                  .bottomPadded4(),
                                                              CommonText(
                                                                text:
                                                                    '${prayer?.imsak}',
                                                              )
                                                                  .topPadded4()
                                                                  .bottomPadded4()
                                                                  .leftPadded4(),
                                                              CommonText(
                                                                text:
                                                                    '${prayer?.subuh}',
                                                              )
                                                                  .topPadded4()
                                                                  .bottomPadded4()
                                                                  .leftPadded4(),
                                                              CommonText(
                                                                text:
                                                                    '${prayer?.dhuha}',
                                                              )
                                                                  .topPadded4()
                                                                  .bottomPadded4()
                                                                  .leftPadded4(),
                                                              CommonText(
                                                                text:
                                                                    '${prayer?.dzuhur}',
                                                              )
                                                                  .topPadded4()
                                                                  .bottomPadded4()
                                                                  .leftPadded4(),
                                                              CommonText(
                                                                text:
                                                                    '${prayer?.ashar}',
                                                              )
                                                                  .topPadded4()
                                                                  .bottomPadded4()
                                                                  .leftPadded4(),
                                                              CommonText(
                                                                text:
                                                                    '${prayer?.maghrib}',
                                                              )
                                                                  .topPadded4()
                                                                  .bottomPadded4()
                                                                  .leftPadded4(),
                                                              CommonText(
                                                                text:
                                                                    '${prayer?.isya}',
                                                              )
                                                                  .topPadded4()
                                                                  .bottomPadded4()
                                                                  .leftPadded4(),
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
                            ),
                          ),
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
