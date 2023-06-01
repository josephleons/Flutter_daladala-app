// class take data from firebase store
class ListService {
  final String username;
  final DateTime serviceDate;
  final double budget;
  final String carname;
  final String image;

  ListService(
      this.username, this.serviceDate, this.carname, this.budget, this.image);
}
