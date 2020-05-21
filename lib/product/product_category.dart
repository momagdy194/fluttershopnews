class ProductCategory{
  int category_id;
  String category_name, image_direction, image_url;

 ProductCategory(this.category_id, this.category_name, this.image_direction,
     this.image_url);

 ProductCategory.fromJson(Map<String,dynamic>jsonObject){
   this.category_id = jsonObject['category_id'];
   this.category_name = jsonObject['category_name'];
   this.image_direction = jsonObject['image_direction'];
   this.image_url = jsonObject['image_url'];
 }
}
