class Allproductmodel {
    final int id;
    final String name;
    final String price;
    final String regularPrice;
    final String salePrice;
    final bool onSale;
    final String image;
    final String rating;
    final int reviewCount;
    final String stockStatus;
    final bool inStock;

    Allproductmodel({
        required this.id,
        required this.name,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.onSale,
        required this.image,
        required this.rating,
        required this.reviewCount,
        required this.stockStatus,
        required this.inStock,
    });

    factory Allproductmodel.fromJson(Map<String, dynamic> json) => Allproductmodel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        onSale: json["on_sale"],
        image: json["image"],
        rating: json["rating"],
        reviewCount: json["review_count"],
        stockStatus: json["stock_status"],
        inStock: json["in_stock"],
    );
}
