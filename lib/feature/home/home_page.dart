import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/dummy_data.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:demoapp/feature/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: buttonColor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 16.px,
              )),
          title: Text(
            'Top Products',
            style: GoogleFonts.poppins(
                fontSize: 18.px, fontWeight: FontWeight.w500),
          ),
          actions: [
            GestureDetector(
                onTap: () {}, child: Image.asset('assets/images/appbar1.png')),
            sizedBoxWidth20,
            Image.asset('assets/images/appbar2.png'),
            sizedBoxWidth20,
            Image.asset('assets/images/appbar3.png'),
            sizedBoxWidth20,
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/topproduct.png')),
                    sizedBoxWidth10,
                    Text(
                      'Filters',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 15.px),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          color: const Color(0xffE2E5D7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sort By',
                            style: GoogleFonts.poppins(
                                fontSize: 13.px, fontWeight: FontWeight.w500),
                          ),
                          const Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    )
                  ],
                ),
                sizedBoxHeight10,
                SizedBox(
                    width: 100.w,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 9.0,
                              childAspectRatio: 0.75),
                      itemCount: allProductDetailModel.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                productDetails:
                                    allProductDetailModel.data[index]));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color.fromARGB(255, 230, 227, 227),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.network(
                                      allProductDetailModel
                                          .data[index].image.first.url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          allProductDetailModel
                                              .data[index].productName,
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 13.px,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          allProductDetailModel
                                              .data[index].description,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          allProductDetailModel
                                              .data[index].discountPrice
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 13.px,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Spacer(),
                                        Text(
                                          'MOQ: 4 Pcs',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13.px),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          allProductDetailModel
                                              .data[index].originalPrice
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.black26,
                                              fontSize: 13.px,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        sizedBoxWidth10,
                                        Text(
                                          allProductDetailModel
                                              .data[index].discount
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13.px,
                                              color: Colors.green),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      VxRating(
                                        count: 5,
                                        selectionColor: buttonColor,
                                        onRatingUpdate: (value) {},
                                      ),
                                      Text(
                                        allProductDetailModel
                                            .data[index].rating
                                            .toString(),
                                        style: TextStyle(
                                            color: grey, fontSize: 12.px),
                                      )
                                    ],
                                  ),
                                  // sizedBoxHeight20,
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
