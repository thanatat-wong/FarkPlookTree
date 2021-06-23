class HomeData {
  final int countDonator;
  final int countCampaign;
  final int sumTreeAmount;
  final int myplantedtree;

  HomeData(
      {this.countDonator,
      this.countCampaign,
      this.sumTreeAmount,
      this.myplantedtree});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      countDonator: json['countdonator'],
      countCampaign: json['countcampaign'],
      sumTreeAmount: json['sumtreeamount'],
      myplantedtree: json['myplantedtree'],
    );
  }
}
