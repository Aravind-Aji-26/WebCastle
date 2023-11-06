class HomeData {
  int? errorCode;
  String? message;
  Data? data;

  HomeData({this.errorCode, this.message, this.data});

  HomeData.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  static List<HomeData> convertToList(List<dynamic> list){
    if(list == null) return [];

    List<HomeData> data = [];
    list.forEach((element) {
      data.add(HomeData.fromJson(element));
    });
    return data;
  }
}

class Data {
  List<HomeFields>? homeFields;

  Data({this.homeFields});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['home_fields'] != null) {
      homeFields = <HomeFields>[];
      json['home_fields'].forEach((v) {
        homeFields!.add(new HomeFields.fromJson(v));
      });
    }
  }

  static List<Data> convertToList(List<dynamic> list){
    if(list == null) return [];

    List<Data> data = [];
    list.forEach((element) {
      data.add(Data.fromJson(element));
    });
    return data;
  }
}

class HomeFields {
  String? type;
  List<CarouselItems>? carouselItems;
  List<Brands>? brands;
  List<Categories>? categories;
  String? image;
  int? collectionId;
  String? name;
  List<Products>? products;
  List<Banners>? banners;
  CarouselItems? banner;

  HomeFields(
      {this.type,
        this.carouselItems,
        this.brands,
        this.categories,
        this.image,
        this.collectionId,
        this.name,
        this.products,
        this.banners,
        this.banner});

  HomeFields.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['carousel_items'] != null) {
      carouselItems = <CarouselItems>[];
      json['carousel_items'].forEach((v) {
        carouselItems!.add(new CarouselItems.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    image = json['image'];
    collectionId = json['collection_id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    banner = json['banner'] != null
        ? new CarouselItems.fromJson(json['banner'])
        : null;
  }

  static List<HomeFields> convertToList(List<dynamic> list){
    if(list == null) return [];

    List<HomeFields> data = [];
    list.forEach((element) {
      data.add(HomeFields.fromJson(element));
    });
    return data;
  }
}


class Banners {
  String? image;
  String? type;
  int? id;

  Banners({this.image, this.type, this.id});

  Banners.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    type = json['type'];
    id = json['id'];
  }

  static List<Banners> convertToList(List<dynamic> list){
    if(list == null) return [];

    List<Banners> data = [];
    list.forEach((element) {
      data.add(Banners.fromJson(element));
    });
    return data;
  }
}

class CarouselItems {
  String? image;
  String? type;
  int? id;

  CarouselItems({this.image, this.type, this.id});

  CarouselItems.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    type = json['type'];
    id = json['id'];
  }

  static List<CarouselItems> convertToList(List<dynamic> list){
    if(list == null) return [];

    List<CarouselItems> data = [];
    list.forEach((element) {
      data.add(CarouselItems.fromJson(element));
    });
    return data;
  }
}

class Brands {
  int? id;
  String? name;
  String? image;

  Brands({this.id, this.name, this.image});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  static List<Brands> convertToList(List<dynamic> list){
    if(list == null) return [];

    List<Brands> data = [];
    list.forEach((element) {
      data.add(Brands.fromJson(element));
    });
    return data;
  }
}


class Categories {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  static List<Categories> convertToList(List<dynamic> list){
    if(list == null) return [];

    List<Categories> data = [];
    list.forEach((element) {
      data.add(Categories.fromJson(element));
    });
    return data;
  }
}

class Products {
  int? id;
  String? image;
  String? name;
  String? currency;
  String? unit;
  double? price;
  double? actualPrice;
  String? offer;
  bool? wishlisted;
  bool? rfqStatus;

  Products(
      {this.id,
        this.image,
        this.name,
        this.currency,
        this.unit,
        this.price,
        this.actualPrice,
        this.offer,
        this.wishlisted,
        this.rfqStatus});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'] ?? 'Product Name';
    currency = json['currency'];
    unit = json['unit'];
    price = json['price'] != null ? double.tryParse(json['price'].toString()) : null;
    actualPrice = json['actual_price'] != null ? double.tryParse(json['actual_price'].toString()) : null;
    offer = json['offer'];
    wishlisted = json['wishlisted'];
    rfqStatus = json['rfq_status'];
  }

  static List<Products> convertToList(List<dynamic> list){
    if(list == null) return [];

    List<Products> data = [];
    list.forEach((element) {
      data.add(Products.fromJson(element));
    });
    return data;
  }
}