import 'package:demoapp/core/models/all_product_detail_model.dart';

final List<String> sectors = [
  "Electrical",
  "Mechanical",
  "Components and Parts",
  "Furniture",
  "Clothing",
];

final AllProductDetailModel allProductDetailModel = AllProductDetailModel(
  data: [
    Datum(
      id: '1',
      vendorId: 'vendor_001',
      productName: 'Electrical Wire',
      description: 'High quality electrical wire for various applications.',
      image: [
        Image(
            url:
                'https://tiimg.tistatic.com/fp/1/007/818/high-strength-sturdy-durable-flexible-multicolor-pvc-copper-electric-wire-426.jpg',
            id: 'img1'),
        Image(
            url:
                'https://www.thespruce.com/thmb/Cex2M-1xewZFbbEWjZk__n3CeNw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/electrical-wire-color-coding-1152863_hero-572ac6b6d4924c92942c55e31595fa3c.jpg',
            id: 'img267'),
      ],
      originalPrice: 100,
      discountPrice: 90,
      discount: 10,
      discountActive: true,
      mainCategory: sectors[0],
      categoryId: 'cat_001',
      subCategoryId: 'subcat_001',
      rating: 4.5,
      numOfReviews: 10,
      size: ['1 meter', '5 meters', '10 meters'],
      color: ['Black', 'Red'],
      stock: 50,
      status: true,
      isProductVerified: true,
      reviews: [
        Review(
            user: 'user1',
            name: 'John Doe',
            rating: 5,
            comment: 'Great quality!',
            id: 'rev1'),
      ],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isDeal: false,
    ),
    Datum(
      id: '2',
      vendorId: 'vendor_002',
      productName: 'Circuit Breaker',
      description: 'Reliable circuit breaker for safety and protection.',
      image: [
        Image(
            url:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu57B3NESD8OJV3seEuJ2l6gyNbcOsr0tlXA&s',
            id: 'img2'),
      ],
      originalPrice: 150,
      discountPrice: 130,
      discount: 20,
      discountActive: true,
      mainCategory: sectors[0],
      categoryId: 'cat_002',
      subCategoryId: 'subcat_002',
      rating: 4.0,
      numOfReviews: 15,
      size: ['10A', '16A', '20A'],
      color: ['White', 'Grey'],
      stock: 30,
      status: true,
      isProductVerified: true,
      reviews: [
        Review(
            user: 'user2',
            name: 'Jane Doe',
            rating: 4,
            comment: 'Works well.',
            id: 'rev2'),
      ],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isDeal: false,
    ),
    Datum(
      id: '4',
      vendorId: 'vendor_004',
      productName: 'LED Light Bulb',
      description: 'Energy-saving LED light bulb.',
      image: [
        Image(
            url:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvXdonHC_46feSHhLYKl1KnLXPnMS0qXSWSQ&s',
            id: 'img4'),
        Image(
            url: 'https://m.media-amazon.com/images/I/61DWafky0NL.jpg',
            id: 'img576'),
      ],
      originalPrice: 50,
      discountPrice: 40,
      discount: 10,
      discountActive: true,
      mainCategory: sectors[0],
      categoryId: 'cat_004',
      subCategoryId: 'subcat_004',
      rating: 4.8,
      numOfReviews: 5,
      size: ['9W', '12W'],
      color: ['Warm White', 'Cool White'],
      stock: 100,
      status: true,
      isProductVerified: true,
      reviews: [
        const Review(
            user: 'user4',
            name: 'Bob',
            rating: 4,
            comment: 'Good brightness.',
            id: 'rev4'),
      ],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isDeal: false,
    ),
  ],
);
