class RegisterCampaignResponse {
  String join_code;
  RegisterCampaignResponse({this.join_code});
  factory RegisterCampaignResponse.fromJson(Map<String, dynamic> json) {
    return RegisterCampaignResponse(join_code: json['join_code']);
  }
}
