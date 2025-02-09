class EventDataModel{
  static const String collectionName="EvenDataCollection";
  String? eventId;
  final String eventTitle;
  final String eventImage;
  final String eventDescription;
  final String eventCategory;
  final DateTime eventDate;
  bool isFavorite;

  EventDataModel({
    this.eventId,
    required this.eventTitle,
    required this.eventImage,
    required this.eventDescription,
    required this.eventCategory,
    required this.eventDate,
    this.isFavorite=false,
  });
 factory EventDataModel.fromeFirestore(Map<String,dynamic> json) => EventDataModel(
      eventId: json["eventId"],
      eventTitle: json["eventTitle"],
      eventImage: json["eventImage"],
      eventDescription: json["eventDescription"],
      eventCategory: json["eventCategory"],
      eventDate:DateTime.fromMillisecondsSinceEpoch(json["eventDate"]),
      isFavorite:json["isFavorite"],
  );

  Map<String,dynamic> toFirestore(){
    return{
      "eventId":eventId,
      "eventTitle":eventTitle,
      "eventImage":eventImage,
      "eventDescription":eventDescription,
      "eventCategory":eventCategory,
      "eventDate":eventDate.millisecondsSinceEpoch,
      "isFavorite":isFavorite,

    };
  }
}