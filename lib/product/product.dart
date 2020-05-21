import 'package:shopnew/product/product_category.dart';
import 'package:shopnew/product/product_tag.dart';
import 'package:shopnew/product/product_unit.dart';
import 'package:shopnew/review/product_review.dart';

class Product {
  int product_id;
  String product_title,
      product_description,
      product_price,
      product_total,
      product_discount;
  ProductUnit productUnit;
  ProductCategory productCategory;
  List<ProductTag> tag;
  List<String>images;
  List<ProductReview> reviews;

  Product(
      this.product_id,
      this.product_description,
      this.productUnit,
      this.product_price,
      this.product_total,
      this.product_discount,
      this.productCategory,
      this.tag,
      this.images,
      this.reviews);

  Product.fromJson(Map<String, dynamic> jsonObject) {

    this.product_id = jsonObject['product_id'];
    this.product_title = jsonObject['product_title'];

    this.product_description = jsonObject['product_description'];

    this.product_price = jsonObject['product_price'].toString();

    this.product_discount = jsonObject['product_discount'].toString();

    this.product_total = jsonObject['product_total'].toString();

    this.productCategory =
        ProductCategory.fromJson(jsonObject['product_category']);

    if (jsonObject['product_images'] != null) {
      _set_images(jsonObject['product_images']);
    }
  }

  void _setReview(List<dynamic> reviewerJason) {
    this.reviews = [];
    if (reviewerJason.length > 0) {
      for (var item in reviewerJason) {
        if (item != null) {
          this.reviews.add(ProductReview.fromJson(item));
        }
      }
    }
  }

  void _setTag(List<dynamic> tagJson) {
    this.tag = [];
    if (tagJson.length > 0) {
      for (var item in tagJson) {
        if (item != null) {
          tag.add(ProductTag.fromJson(item));
        }
      }
    }
  }

  void _set_images(List<dynamic> jsonImages) {
    this.images = [];
    if (jsonImages.length > 0) {
      for (var image in jsonImages) {
        if (image != null) {
          this.images.add(image['image_url']);
        }
      }
    }
  }
}
