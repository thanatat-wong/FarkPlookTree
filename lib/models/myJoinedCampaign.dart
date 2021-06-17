class MyJoinedCampaign {
  final String join_code;
  final String name;
  final String surname;
  final String contact_email;
  final String phone;
  final String campaign_no;
  final String register_datetime;
  final bool isjoined;

  MyJoinedCampaign({
    this.join_code,
    this.name,
    this.surname,
    this.contact_email,
    this.phone,
    this.campaign_no,
    this.isjoined,
    this.register_datetime,
  });
  factory MyJoinedCampaign.fromJson(Map<String, dynamic> json) {
    return MyJoinedCampaign(
      join_code: json['join_code'],
      name: json['name'],
      surname: json['surname'],
      contact_email: json['contact_email'],
      phone: json['phone'],
      campaign_no: json['campaign_no'].toString(),
      isjoined: (json['isjoined'] == 0) ? false : true,
      register_datetime: json['register_datetime'],
    );
  }
}
