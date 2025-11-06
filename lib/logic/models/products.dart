class ProductsModel {
    final int id;
    final String name;
    final String slug;
    final String description;
    final String shortDescription;
    final double price;
    final double comparePrice;
    final int discountPercentage;
    final dynamic stockQuantity;
    final String stockStatus;
    final bool isFeatured;
    final bool isActive;
    final List<Image> images;
    final Category category;
    final Reviews reviews;
    final DateTime createdAt;
    final DateTime updatedAt;

    ProductsModel({
        required this.id,
        required this.name,
        required this.slug,
        required this.description,
        required this.shortDescription,
        required this.price,
        required this.comparePrice,
        required this.discountPercentage,
        required this.stockQuantity,
        required this.stockStatus,
        required this.isFeatured,
        required this.isActive,
        required this.images,
        required this.category,
        required this.reviews,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        shortDescription: json["short_description"],
        price: json["price"]?.toDouble(),
        comparePrice: json["compare_price"]?.toDouble(),
        discountPercentage: json["discount_percentage"],
        stockQuantity: json["stock_quantity"],
        stockStatus: json["stock_status"],
        isFeatured: json["is_featured"],
        isActive: json["is_active"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        category: Category.fromJson(json["category"]),
        reviews: Reviews.fromJson(json["reviews"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "short_description": shortDescription,
        "price": price,
        "compare_price": comparePrice,
        "discount_percentage": discountPercentage,
        "stock_quantity": stockQuantity,
        "stock_status": stockStatus,
        "is_featured": isFeatured,
        "is_active": isActive,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "category": category.toJson(),
        "reviews": reviews.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Image {
    final String id;
    final String url;
    final String alt;
    final bool isPrimary;

    Image({
        required this.id,
        required this.url,
        required this.alt,
        required this.isPrimary,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        alt: json["alt"],
        isPrimary: json["is_primary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "alt": alt,
        "is_primary": isPrimary,
    };
}

class Category {
    final int id;
    final String name;
    final String slug;

    Category({
        required this.id,
        required this.name,
        required this.slug,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}
class Reviews {
    final int averageRating;
    final int reviewCount;

    Reviews({
        required this.averageRating,
        required this.reviewCount,
    });

    factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        averageRating: json["average_rating"],
        reviewCount: json["review_count"],
    );

    Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "review_count": reviewCount,
    };
}
