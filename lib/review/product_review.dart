import 'package:shopnew/review/reviewar.dart';

class ProductReview{
  int review_id,stars;
  String review;
Reviewer reviewer;

  ProductReview(this.review_id, this.stars, this.review, this.reviewer);
  ProductReview.fromJson(Map<String,dynamic>jsonObject){
    this.review_id=jsonObject['review_id'];
    this.stars=jsonObject['stars'];
    this.review=jsonObject['review'];
    this.reviewer=jsonObject['reviewer'];
  }


}