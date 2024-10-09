import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:demoapp/feature/product/components/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/models/all_product_detail_model.dart' as model;

class ProductDetailsScreen extends StatefulWidget {
  final model.Datum productDetails;
  const ProductDetailsScreen({required this.productDetails, super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            
            backgroundColor: buttonColor,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 17.sp,
                )),
            title: Text(
              'Products Details',
              style: GoogleFonts.poppins(
                  fontSize: 18.px, fontWeight: FontWeight.w500),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              children: [
                SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxHeight20,
                        Stack(
                          children: [
                            SizedBox(
                                height: Adaptive.h(22),
                                // color: black,
                                child: Image.network(
                                  width: double.infinity,
                                  widget.productDetails.image.first.url,
                                  fit: BoxFit.cover,
                                )),
                            if (widget.productDetails.image.length > 1)
                              Positioned(
                                bottom: 5,
                                left: 4,
                                child: SizedBox(
                                  height: Adaptive.h(8),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        sizedBoxWidth05,
                                    itemCount:
                                        widget.productDetails.image.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Image.network(widget
                                          .productDetails.image[index].url);
                                    },
                                  ),
                                ),
                              )
                          ],
                        ),
                        sizedBoxHeight20,
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.sp, vertical: 10.sp),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black45,
                              ),
                              borderRadius: BorderRadius.circular(22.sp)),
                          child: IntrinsicWidth(
                            child: Center(
                              child: Text(
                                'tap to see in 360',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.px),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxHeight20,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color: ${widget.productDetails.color.join(", ")} ',
                              style: GoogleFonts.poppins(
                                  fontSize: 15.px,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Text(
                                'Colors: ${widget.productDetails.color.length}',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.px,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight20,
                        SizedBox(
                          height: Adaptive.h(10),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                    width: Adaptive.w(23),
                                    height: Adaptive.h(7),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                        child: Image.network(
                                          widget
                                              .productDetails.image[index].url,
                                          fit: BoxFit.fill,
                                        )));
                              },
                              separatorBuilder: (context, index) =>
                                  sizedBoxWidth10,
                              itemCount: widget.productDetails.image.length),
                        ),
                        sizedBoxHeight10,
                        Row(
                          children: [
                            Text(
                              widget.productDetails.productName,
                              style: GoogleFonts.poppins(
                                fontSize: 15.px,
                                fontWeight: FontWeight.w500,
                                // color: Colors.black54
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Available ',
                              style: GoogleFonts.poppins(
                                  fontSize: 15.px,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                        sizedBoxHeight15,
                        Row(
                          children: [
                            VxRating(
                              count: 5,
                              selectionColor: buttonColor,
                              onRatingUpdate: (value) {},
                            ),
                            sizedBoxWidth10,
                            Text(
                              'Very Good ',
                              style: GoogleFonts.poppins(
                                  fontSize: 11.px,
                                  fontWeight: FontWeight.w400,
                                  color: chatColor),
                            ),
                            sizedBoxWidth10,
                            Text(
                              '56890 ',
                              style: GoogleFonts.poppins(
                                  fontSize: 11.px,
                                  fontWeight: FontWeight.w400,
                                  color: grey),
                            ),
                            sizedBoxWidth10,
                            Text(
                              'ratings ',
                              style: GoogleFonts.poppins(
                                  fontSize: 11.px,
                                  fontWeight: FontWeight.w400,
                                  color: grey),
                            )
                          ],
                        ),
                        sizedBoxHeight10,
                        Row(
                          children: [
                            Text(
                              '₹ ${widget.productDetails.originalPrice}',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black26,
                                  fontSize: 16.px,
                                  fontWeight: FontWeight.w500),
                            ),
                            sizedBoxWidth10,
                            Text(
                              '₹ ${widget.productDetails.discountPrice}',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 17.px,
                                  fontWeight: FontWeight.w600),
                            ),
                            sizedBoxWidth10,
                            Text(
                              '${widget.productDetails.discount}% off',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.px,
                                  color: Colors.green),
                            ),
                            Spacer(),
                            Text(
                              'MOQ: 4 Pcs',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 13.px),
                            )
                          ],
                        ),
                        sizedBoxHeight10,
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Free Delivery ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green),
                            )),
                        sizedBoxHeight10,
                        Row(
                          children: [
                            Text(
                              'Deliver to:Pune-411045',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 15.px),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.w(2),
                                  vertical: Adaptive.h(1)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.sp),
                                  border: Border.all(
                                    color: buttonColor,
                                  )),
                              child: Center(
                                child: Text(
                                  'Change',
                                  style: TextStyle(color: buttonColor),
                                ),
                              ),
                            )
                          ],
                        ),
                        sizedBoxHeight10,
                        Divider(
                          color: black,
                        ),
                        sizedBoxHeight20,
                        delivaryContainer(),
                        sizedBoxHeight20,
                        containerFunctions(
                            'delivary2', '10 Days Return Policy'),
                        sizedBoxHeight20,
                        containerFunctions(
                            'delivary3', 'Cash on Delivery Available'),
                        sizedBoxHeight20,
                        Divider(
                          color: black,
                        ),
                        sizedBoxHeight20,
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: Adaptive.h(2.5)),
                          decoration: BoxDecoration(
                              color: Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Row(
                            children: [
                              // Image.asset('assets/images/$.png'),
                              // sizedBoxWidth20,
                              Text('All Offers & Coupons ',
                                  style: GoogleFonts.poppins(
                                    // decoration: TextDecoration.lineThrough,
                                    // decorationColor: Colors.grey,
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.px,
                                  )),
                              Spacer(),
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        ),
                        sizedBoxHeight15,
                        Divider(
                          color: black,
                        ),
                        sizedBoxHeight20,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Product Details',
                              style: GoogleFonts.poppins(
                                // decoration: TextDecoration.lineThrough,
                                // decorationColor: Colors.grey,
                                color: black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.px,
                              )),
                        ),
                        sizedBoxHeight10,
                        const ProductDetailsWidget(
                          title1: 'Material ',
                          title2: 'Synthetic Leather',
                          isColor: false,
                        ),
                        const ProductDetailsWidget(
                          title1: 'Number of compartments ',
                          title2: '1',
                          isColor: true,
                        ),
                        const ProductDetailsWidget(
                          title1: 'Closure ',
                          title2: 'Zipper',
                          isColor: false,
                        ),
                        const ProductDetailsWidget(
                          title1: 'Width ',
                          title2: '11 inch',
                          isColor: true,
                        ),
                        const ProductDetailsWidget(
                          title1: 'Capacity  ',
                          title2: '5 L',
                          isColor: false,
                        ),
                        sizedBoxHeight20,
                        Row(
                          children: [
                            Text('Rating & Reviews',
                                style: GoogleFonts.poppins(
                                  // decoration: TextDecoration.lineThrough,
                                  // decorationColor: Colors.grey,
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.px,
                                )),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text('AllDetails',
                                  style: GoogleFonts.poppins(
                                    decoration: TextDecoration.underline,
                                    decorationColor: buttonColor,
                                    color: buttonColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.px,
                                  )),
                            )
                          ],
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: _buildIndicatorAndText("Quality")),
                            Expanded(
                                flex: 1,
                                child: _buildIndicatorAndText("Strong space")),
                            Expanded(
                                flex: 1,
                                child: _buildIndicatorAndText("Design ")),
                            Expanded(
                                flex: 1,
                                child: _buildIndicatorAndText("Durability")),
                          ],
                        ),
                        sizedBoxHeight30,
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Priya',
                                          style: GoogleFonts.poppins(
                                            // decoration: TextDecoration.lineThrough,
                                            // decorationColor: Colors.grey,
                                            color: black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.px,
                                          )),
                                      Spacer(),
                                      Text('18-03-2024|10:00 AM',
                                          style: GoogleFonts.poppins(
                                            // decoration: TextDecoration.underline,
                                            // decorationColor: buttonColor,
                                            color: grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.px,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      VxRating(
                                        size: Adaptive.h(2),
                                        count: 5,
                                        selectionColor: buttonColor,
                                        onRatingUpdate: (value) {},
                                      ),
                                      Spacer(),
                                      Text('18-03-2024|10:00 AM',
                                          style: GoogleFonts.poppins(
                                            // decoration: TextDecoration.underline,
                                            // decorationColor: buttonColor,
                                            color: grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.px,
                                          ))
                                    ],
                                  ),
                                  Text(
                                    "is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                    style: GoogleFonts.poppins(
                                        fontSize: 13.px,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  sizedBoxHeight20
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: Adaptive.h(10),
                    right: Adaptive.w(3),
                    child: Image.asset('assets/images/detailsstack.png'))
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: Adaptive.h(6),
                width: Adaptive.w(45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(
                    color: buttonColor,
                  ),
                  color: whiteColor,
                ),
                child: Center(
                  child: Text(
                    'Add To Cart',
                    style: GoogleFonts.poppins(
                        fontSize: 15.px,
                        color: buttonColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ).onTap(() {}),
              Container(
                height: Adaptive.h(6),
                width: Adaptive.w(45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(
                    color: buttonColor,
                  ),
                  color: buttonColor,
                ),
                child: Center(
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.poppins(
                        fontSize: 15.px,
                        color: whiteColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

//=================================================================
  Widget _buildIndicatorAndText(String text) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: Adaptive.w(10),
          lineWidth: 5.0,
          percent: 0.8,
          center: new Text("4.4"),
          progressColor: Colors.green,
        ),
        sizedBoxHeight10,
        Text(
          text,
          style: GoogleFonts.poppins(
            decoration: TextDecoration.underline,
            decorationColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontSize: 12.px,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Container containerFunctions(String image, String title) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 12.sp, vertical: Adaptive.h(2.5)),
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        children: [
          Image.asset('assets/images/$image.png'),
          sizedBoxWidth20,
          Text('$title ',
              style: GoogleFonts.poppins(
                // decoration: TextDecoration.lineThrough,
                // decorationColor: Colors.grey,
                color: black,
                fontWeight: FontWeight.w500,
                fontSize: 16.px,
              )),
          Spacer(),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }

  Container delivaryContainer() {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        children: [
          Image.asset('assets/images/delivary.png'),
          sizedBoxWidth20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Free Delivery',
                    style: GoogleFonts.poppins(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.green,
                        color: Colors.green,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.px)),
                WidgetSpan(
                  child: SizedBox(width: 2.w), // Add space between text spans
                ),
                TextSpan(
                    text: '₹40 ',
                    style: GoogleFonts.poppins(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey,
                        color: grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.px)),
                WidgetSpan(
                  child: SizedBox(width: 2.w), // Add space between text spans
                ),
                TextSpan(
                    text: 'Delivery by ',
                    style: GoogleFonts.poppins(
                      // decoration: TextDecoration.lineThrough,
                      // decorationColor: Colors.grey,
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.px,
                    ))
              ])),
              Text('21 Mar, Thursday ',
                  style: GoogleFonts.poppins(
                    // decoration: TextDecoration.lineThrough,
                    // decorationColor: Colors.grey,
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.px,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class SimilarPopularBrandWidget extends StatelessWidget {
  const SimilarPopularBrandWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 230, 227, 227),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  // height: 11.h,
                  width: 100.w,
                  // color: green,
                  child: Image.asset(
                    'assets/images/wishlist${index + 1}.png',
                    fit: BoxFit.cover,
                    width: 100.w,
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
                        'Levis',
                        style: TextStyle(
                            color: black,
                            fontSize: 13.px,
                            fontWeight: FontWeight.w600),
                      )

                      // Icon(Icons.share,size: 12.sp,color: green,)
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 5),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text('Neque porro quisquam est qui dolorem ipsum quia',maxLines: 2, style:
                //     TextStyle(color: black,fontSize: 10.px,fontWeight: FontWeight.bold),)),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'black shing Bag |',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 11.px,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        'MOQ:4 Pcs',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 12.px),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '6500',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black26,
                            fontSize: 13.px,
                            fontWeight: FontWeight.w500),
                      ),

                      sizedBoxWidth10,
                      Text(
                        '₹ 949',
                        style: TextStyle(
                            color: black,
                            fontSize: 13.px,
                            fontWeight: FontWeight.w600),
                      ),
                      sizedBoxWidth10,
                      Spacer(),
                      Text(
                        '74% off',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.px,
                            color: Colors.green),
                      ),
                      // Spacer(),
                      // Text(
                      //   'MOQ: 4 Pcs',
                      //   style: GoogleFonts.poppins(
                      //       fontWeight: FontWeight.w400, fontSize: 13.px),
                      // )
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
                      '56890',
                      style: TextStyle(color: grey, fontSize: 12.px),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Free Delivary By',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 11.px,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        '18 March',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 12.px),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  // (),
                  Icon(
                    Icons.favorite,
                    color: red,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
