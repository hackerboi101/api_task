// ignore_for_file: no_leading_underscores_for_local_identifiers

class Products {
  int? success;
  bool? error;
  List<ProductList>? productList;
  PageInfo? pageInfo;

  Products({this.success, this.error, this.productList, this.pageInfo});

  Products.fromJson(Map<String, dynamic> json) {
    success = json["Success"];
    error = json["error"];
    productList = json["ProductList"] == null
        ? null
        : (json["ProductList"] as List)
            .map((e) => ProductList.fromJson(e))
            .toList();
    pageInfo =
        json["PageInfo"] == null ? null : PageInfo.fromJson(json["PageInfo"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Success"] = success;
    _data["error"] = error;
    if (productList != null) {
      _data["ProductList"] = productList?.map((e) => e.toJson()).toList();
    }
    if (pageInfo != null) {
      _data["PageInfo"] = pageInfo?.toJson();
    }
    return _data;
  }
}

class PageInfo {
  int? pageNo;
  int? pageSize;
  int? pageCount;
  int? totalRecordCount;

  PageInfo({this.pageNo, this.pageSize, this.pageCount, this.totalRecordCount});

  PageInfo.fromJson(Map<String, dynamic> json) {
    pageNo = json["PageNo"];
    pageSize = json["PageSize"];
    pageCount = json["PageCount"];
    totalRecordCount = json["TotalRecordCount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["PageNo"] = pageNo;
    _data["PageSize"] = pageSize;
    _data["PageCount"] = pageCount;
    _data["TotalRecordCount"] = totalRecordCount;
    return _data;
  }
}

class ProductList {
  int? id;
  dynamic type;
  dynamic parentCode;
  String? name;
  String? code;
  double? price;
  double? costPrice;
  String? unitName;
  String? categoryName;
  String? brandName;
  String? modelName;
  String? variantName;
  String? sizeName;
  String? colorName;
  double? oldPrice;
  dynamic imagePath;
  String? productBarcode;
  String? description;
  List<dynamic>? childList;
  List<dynamic>? warehouseList;
  double? currentStock;
  String? createDate;
  String? updateDate;

  ProductList(
      {this.id,
      this.type,
      this.parentCode,
      this.name,
      this.code,
      this.price,
      this.costPrice,
      this.unitName,
      this.categoryName,
      this.brandName,
      this.modelName,
      this.variantName,
      this.sizeName,
      this.colorName,
      this.oldPrice,
      this.imagePath,
      this.productBarcode,
      this.description,
      this.childList,
      this.warehouseList,
      this.currentStock,
      this.createDate,
      this.updateDate});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    type = json["Type"];
    parentCode = json["ParentCode"];
    name = json["Name"];
    code = json["Code"];
    price = json["Price"];
    costPrice = json["CostPrice"];
    unitName = json["UnitName"];
    categoryName = json["CategoryName"];
    brandName = json["BrandName"];
    modelName = json["ModelName"];
    variantName = json["VariantName"];
    sizeName = json["SizeName"];
    colorName = json["ColorName"];
    oldPrice = json["OldPrice"];
    imagePath = json["ImagePath"];
    productBarcode = json["ProductBarcode"];
    description = json["Description"];
    childList = json["ChildList"] ?? [];
    warehouseList = json["WarehouseList"] ?? [];
    currentStock = json["CurrentStock"];
    createDate = json["CreateDate"];
    updateDate = json["UpdateDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Id"] = id;
    _data["Type"] = type;
    _data["ParentCode"] = parentCode;
    _data["Name"] = name;
    _data["Code"] = code;
    _data["Price"] = price;
    _data["CostPrice"] = costPrice;
    _data["UnitName"] = unitName;
    _data["CategoryName"] = categoryName;
    _data["BrandName"] = brandName;
    _data["ModelName"] = modelName;
    _data["VariantName"] = variantName;
    _data["SizeName"] = sizeName;
    _data["ColorName"] = colorName;
    _data["OldPrice"] = oldPrice;
    _data["ImagePath"] = imagePath;
    _data["ProductBarcode"] = productBarcode;
    _data["Description"] = description;
    if (childList != null) {
      _data["ChildList"] = childList;
    }
    if (warehouseList != null) {
      _data["WarehouseList"] = warehouseList;
    }
    _data["CurrentStock"] = currentStock;
    _data["CreateDate"] = createDate;
    _data["UpdateDate"] = updateDate;
    return _data;
  }
}
