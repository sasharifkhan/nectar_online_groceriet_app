class Categoriesmodel {
    final int id;
    final String name;
    final String slug;
    final int count;
    final dynamic image;

    Categoriesmodel({
        required this.id,
        required this.name,
        required this.slug,
        required this.count,
        required this.image,
    });

    factory Categoriesmodel.fromJson(Map<String, dynamic> json) => Categoriesmodel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        count: json["count"],
        image: json["image"],
    );
}
