class Address {
  final String id;
  final String province;
  final String city;
  final String address;

  Address({
    required this.id,
    required this.city,
    required this.province,
    required this.address
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      city: json['city'],
      province: json['province'],
      address: json['address']
    );
  }
}
