import 'package:flutter/cupertino.dart';

class Products {

  String title;
  String description;
  String image;
  int price;
  int weight;
  int percent;
  String content;
  String dosage;
  String type;
  String detail;


  Products(this.title, this.description, this.image, this.price, this.weight, this.percent, this.content, this.dosage, this.type,this.detail);

}

List<Products> getProducts(){
  return <Products>[
    Products("Bio-Organic G-5", "help in promoting healthy growth of lawns, trees, shrubs and flowers.", "images/BioOrganic.jpeg", 250, 500, 6,"Content: 100% Sea Weed extract ","Dosage: Add 3 to 5 ml per liter of water and spray every 2 weeks.","Application Type: Sprayer","Used for nurturing the healthy growth of plants. This is a pre-mixed formula of all essential plant nutrients. It promotes healthy root growth and better, denser foliage. Supplement you plants with this tonic for better growth and flowering at regular intervals. Always use the tonic either early morning or in the evening, never in peak sun."),
    Products("Gardenia Cow Manure", "nutrition for all types of plants and promotes vigorous growth.", "images/cow_manure.jpeg", 200, 250, 10,"Content: 100% Sea Weed extract ","Dosage: Add 7 to 8 ml per liter of water and spray every 2 weeks.","Application Type: Soil Type","Used for nurturing the healthy growth of plants. This is a pre-mixed formula of all essential plant nutrients. It promotes healthy root growth and better, denser foliage. Supplement you plants with this tonic for better growth and flowering at regular intervals. Always use the tonic either early morning or in the evening, never in peak sun."),
    Products("K-Up Organic Potash", "Spray for seed to grow into small plant", "images/kuppotash100ml.jpeg", 150, 250, 8,"Content: 100% Sea Weed extract ","Dosage: Add 3 to 5 ml per liter of water and spray every 2 weeks.","Application Type: Sprayer","Used for nurturing the healthy growth of plants. This is a pre-mixed formula of all essential plant nutrients. It promotes healthy root growth and better, denser foliage. Supplement you plants with this tonic for better growth and flowering at regular intervals. Always use the tonic either early morning or in the evening, never in peak sun."),
    Products("Plan-T-onic", "Spray used for nurturing the healthy growth of plants", "images/plantonic250ml.jpeg", 450, 1000, 12,"Content: 100% Sea Weed extract ","Dosage: Add 3 to 5 ml per liter of water and spray every 2 weeks.","Application Type: Sprayer","Used for nurturing the healthy growth of plants. This is a pre-mixed formula of all essential plant nutrients. It promotes healthy root growth and better, denser foliage. Supplement you plants with this tonic for better growth and flowering at regular intervals. Always use the tonic either early morning or in the evening, never in peak sun."),
    Products("Vermicompost", "Premium Fertilizer for Soil","images/vermicompost.jpeg", 250, 500, 20,"Content: 100% Sea Weed extract ","Dosage: Add 3 to 5 ml per liter of water and spray every 2 weeks.","Application Type: Sprayer","Used for nurturing the healthy growth of plants. This is a pre-mixed formula of all essential plant nutrients. It promotes healthy root growth and better, denser foliage. Supplement you plants with this tonic for better growth and flowering at regular intervals. Always use the tonic either early morning or in the evening, never in peak sun."),
  ];
}