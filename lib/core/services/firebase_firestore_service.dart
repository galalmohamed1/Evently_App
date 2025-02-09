import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_data_models.dart';

abstract class FirebaseFireStoreService{
  //[Function] to get collection reference
  static CollectionReference<EventDataModel> getCollectionReference(){
    /// to add a new event to the Firestore
    /// need to get the firestore collection

    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
        fromFirestore: (snapshot, _) => EventDataModel.fromeFirestore(snapshot.data()!),
        toFirestore: (data, _) => data.toFirestore(),
    );
  }

  //[Function] to add a new event to the firestore
  static Future<bool> createEvent(EventDataModel data)async{
    try{
      var collectionRef=getCollectionReference();
      var docRef= collectionRef.doc();
      data.eventId=docRef.id;
      docRef.set(data);
      return Future.value(true);
    }catch (error){
      return Future.value(false);
    }

  }

  //[Function] to getDataFormFirestore
  static getDataFormFirestore(){
    var collectionRef=getCollectionReference();
  }

  //[Function] to deleteEvent
  static deleteEvent(){

    var collectionRef=getCollectionReference();
  }
}