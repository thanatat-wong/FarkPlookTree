class MyJoinedCampaign {
  final String type;
  final String name;
  final DateTime from_datetime;
  final DateTime to_datetime;
  final String location;
  final String thumbnail;
  final String description;
  final DateTime register_datetime;
  final String join_code;
  final String campaign_no;
  final bool isjoined;

  MyJoinedCampaign({
    this.type,
    this.name,
    this.from_datetime,
    this.to_datetime,
    this.location,
    this.thumbnail,
    this.description,
    this.join_code,
    this.campaign_no,
    this.isjoined,
    this.register_datetime,
  });

  factory MyJoinedCampaign.fromJson(Map<String, dynamic> json) {
    return MyJoinedCampaign(
      type: json['type'],
      name: json['name'],
      from_datetime: DateTime.parse(json['from_datetime']),
      to_datetime: DateTime.parse(json['to_datetime']),
      location: json['location'],
      thumbnail: json['thumbnail'],
      description: json['description'],
      join_code: json['join_code'],
      campaign_no: json['campaign_no'].toString(),
      isjoined: (json['isjoined'] == 0) ? false : true,
      register_datetime: DateTime.parse(json['register_datetime']),
    );
  }
}
