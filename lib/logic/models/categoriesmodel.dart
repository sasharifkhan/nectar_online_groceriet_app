class Categoriesmodel {
    final int id;
    final String name;
    final String slug;
    final String description;
    final dynamic image;
    // final int parentId;
    // final bool isActive;
    // final int sortOrder;
    // final int productCount;
    // final List<dynamic> subcategories;
    // final String createdAt;
    // final String updatedAt;

    Categoriesmodel({
        required this.id,
        required this.name,
        required this.slug,
        required this.description,
        required this.image,
        // required this.parentId,
        // required this.isActive,
        // required this.sortOrder,
        // required this.productCount,
        // required this.subcategories,
        // required this.createdAt,
        // required this.updatedAt,
    });
    factory Categoriesmodel.fromJson(Map<String, dynamic> json) => Categoriesmodel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"], 
        // parentId: json['parentId'],
    );

}
