class HomeData {
  final int countDonator;
  final int countCampaign;
  final int sumTreeAmount;

  HomeData({this.countDonator, this.countCampaign, this.sumTreeAmount});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      countDonator: json['countdonator'],
      countCampaign: json['countcampaign'],
      sumTreeAmount: json['sumtreeamount'],
    );
  }
}
