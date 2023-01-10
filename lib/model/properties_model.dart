class Data {
  int? id;
  String? agencyName;
  bool? forSale;
  bool? forRentLong;
  bool? forRentShort;
  int? priceSale;
  int? priceRentLong;
  int? priceRentShort;
  String? typeName;
  String? subtypeName;
  String? status;
  int? floor;
  String? description;
  String? address1;
  String? address2;
  String? countryName;
  String? provinceName;
  String? districtName;
  String? wardName;
  int? commission;
  int? commissionPct;
  int? commissionListAgent;
  int? commissionListAgentPct;
  int? commissionSellAgent;
  int? commissionSellAgentPct;
  int? beds;
  int? baths;
  int? builtSpace;
  int? gardenSpace;
  int? terraceSpace;
  String? currency;
  String? dimension;
  String? created;
  String? updated;
  List<String>? picProperties;
  String? thumbnailUrl;

  Data(
      {this.id,
        this.agencyName,
        this.forSale,
        this.forRentLong,
        this.forRentShort,
        this.priceSale,
        this.priceRentLong,
        this.priceRentShort,
        this.typeName,
        this.subtypeName,
        this.status,
        this.floor,
        this.description,
        this.address1,
        this.address2,
        this.countryName,
        this.provinceName,
        this.districtName,
        this.wardName,
        this.commission,
        this.commissionPct,
        this.commissionListAgent,
        this.commissionListAgentPct,
        this.commissionSellAgent,
        this.commissionSellAgentPct,
        this.beds,
        this.baths,
        this.builtSpace,
        this.gardenSpace,
        this.terraceSpace,
        this.currency,
        this.dimension,
        this.created,
        this.updated,
        this.picProperties,
        this.thumbnailUrl
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyName = json['agency_name'];
    forSale = json['forSale'];
    forRentLong = json['forRentLong'];
    forRentShort = json['forRentShort'];
    priceSale = json['priceSale'];
    priceRentLong = json['priceRentLong'];
    priceRentShort = json['priceRentShort'];
    typeName = json['type_name'];
    subtypeName = json['subtype_name'];
    status = json['status'];
    floor = json['floor'];
    description = json['description'];
    address1 = json['address1'];
    address2 = json['address2'];
    countryName = json['country_name'];
    provinceName = json['province_name'];
    districtName = json['district_name'];
    wardName = json['ward_name'];
    commission = json['commission'];
    commissionPct = json['commission_pct'];
    commissionListAgent = json['commission_list_agent'];
    commissionListAgentPct = json['commission_list_agent_pct'];
    commissionSellAgent = json['commission_sell_agent'];
    commissionSellAgentPct = json['commission_sell_agent_pct'];
    beds = json['beds'];
    baths = json['baths'];
    builtSpace = json['built_space'];
    gardenSpace = json['garden_space'];
    terraceSpace = json['terrace_space'];
    currency = json['currency'];
    dimension = json['dimension'];
    created = json['created'];
    updated = json['updated'];
    picProperties = (json['pic_properties'] as List<dynamic>?)?.map((e) => e as String).toList() ;
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agency_name'] = this.agencyName;
    data['forSale'] = this.forSale;
    data['forRentLong'] = this.forRentLong;
    data['forRentShort'] = this.forRentShort;
    data['priceSale'] = this.priceSale;
    data['priceRentLong'] = this.priceRentLong;
    data['priceRentShort'] = this.priceRentShort;
    data['type_name'] = this.typeName;
    data['subtype_name'] = this.subtypeName;
    data['status'] = this.status;
    data['floor'] = this.floor;
    data['description'] = this.description;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['country_name'] = this.countryName;
    data['province_name'] = this.provinceName;
    data['district_name'] = this.districtName;
    data['ward_name'] = this.wardName;
    data['commission'] = this.commission;
    data['commission_pct'] = this.commissionPct;
    data['commission_list_agent'] = this.commissionListAgent;
    data['commission_list_agent_pct'] = this.commissionListAgentPct;
    data['commission_sell_agent'] = this.commissionSellAgent;
    data['commission_sell_agent_pct'] = this.commissionSellAgentPct;
    data['beds'] = this.beds;
    data['baths'] = this.baths;
    data['built_space'] = this.builtSpace;
    data['garden_space'] = this.gardenSpace;
    data['terrace_space'] = this.terraceSpace;
    data['currency'] = this.currency;
    data['dimension'] = this.dimension;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['pic_properties'] = this.picProperties;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}