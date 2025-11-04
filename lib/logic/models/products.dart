import 'dart:convert';

class ProductResponse {
  final String status;
  final String message;
  final String timestamp;
  final ProductData data;

  ProductResponse({
    required this.status,
    required this.message,
    required this.timestamp,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'],
      message: json['message'],
      timestamp: json['timestamp'],
      data: ProductData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'timestamp': timestamp,
      'data': data.toJson(),
    };
  }

  static ProductResponse fromJsonString(String jsonString) =>
      ProductResponse.fromJson(json.decode(jsonString));

  String toJsonString() => json.encode(toJson());
}

class ProductData {
  final List<Product> products;
  final Pagination pagination;

  ProductData({
    required this.products,
    required this.pagination,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      products: (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((p) => p.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}

class Product {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String shortDescription;
  final double price;
  final double comparePrice;
  final double discountPercentage;
  final String? stockQuantity;
  final String stockStatus;
  final bool isFeatured;
  final bool isActive;
  final List<ProductImage> images;
  final Category category;
  final Reviews reviews;
  final String createdAt;
  final String updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.comparePrice,
    required this.discountPercentage,
    this.stockQuantity,
    required this.stockStatus,
    required this.isFeatured,
    required this.isActive,
    required this.images,
    required this.category,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      shortDescription: json['short_description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      comparePrice: (json['compare_price'] ?? 0).toDouble(),
      discountPercentage: (json['discount_percentage'] ?? 0).toDouble(),
      stockQuantity: json['stock_quantity']?.toString(),
      stockStatus: json['stock_status'],
      isFeatured: json['is_featured'],
      isActive: json['is_active'],
      images: (json['images'] as List)
          .map((img) => ProductImage.fromJson(img))
          .toList(),
      category: Category.fromJson(json['category']),
      reviews: Reviews.fromJson(json['reviews']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'short_description': shortDescription,
      'price': price,
      'compare_price': comparePrice,
      'discount_percentage': discountPercentage,
      'stock_quantity': stockQuantity,
      'stock_status': stockStatus,
      'is_featured': isFeatured,
      'is_active': isActive,
      'images': images.map((img) => img.toJson()).toList(),
      'category': category.toJson(),
      'reviews': reviews.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class ProductImage {
  final String id;
  final String url;
  final String alt;
  final bool isPrimary;

  ProductImage({
    required this.id,
    required this.url,
    required this.alt,
    required this.isPrimary,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'].toString(),
      url: json['url'],
      alt: json['alt'],
      isPrimary: json['is_primary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'alt': alt,
      'is_primary': isPrimary,
    };
  }
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

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }
}

class Reviews {
  final double averageRating;
  final int reviewCount;

  Reviews({
    required this.averageRating,
    required this.reviewCount,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      averageRating: (json['average_rating'] ?? 0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average_rating': averageRating,
      'review_count': reviewCount,
    };
  }
}

class Pagination {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final PaginationLinks links;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'],
      count: json['count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
      links: PaginationLinks.fromJson(json['links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'count': count,
      'per_page': perPage,
      'current_page': currentPage,
      'total_pages': totalPages,
      'links': links.toJson(),
    };
  }
}

class PaginationLinks {
  final String first;
  final String last;
  final String? prev;
  final String? next;

  PaginationLinks({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'last': last,
      'prev': prev,
      'next': next,
    };
  }
}
