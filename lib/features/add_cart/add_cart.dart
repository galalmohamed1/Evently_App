import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/services/firebase_firestore_service.dart';
import 'package:evently/core/services/snack_bar_service.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/core/widget/custom_text_field.dart';
import 'package:evently/features/add_cart/widget/custom_tab_bar_add.dart';
import 'package:evently/main.dart';
import 'package:evently/models/event_category.dart';
import 'package:evently/models/event_data_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class Add_Card extends StatefulWidget {

   Add_Card({super.key});

  @override
  State<Add_Card> createState() => _Add_CardState();
}

class _Add_CardState extends State<Add_Card> {
  final _formkey=GlobalKey<FormState>();
  final TextEditingController _titelcontroler= TextEditingController();
  final TextEditingController _descriptioncontroler= TextEditingController();
  int selectedTap=0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  List<EventCategory> eventCategories = [

    EventCategory(
      eventCategoryName: "Sport",
      eventCategoryIcon: Icons.directions_bike,
      eventCategoryImg: "assets/images/category/Sport.png",
    ),
    EventCategory(
      eventCategoryName: "BirthDay",
      eventCategoryIcon: Icons.cake_outlined,
      eventCategoryImg: "assets/images/category/Birthday.png",
    ),
    EventCategory(
      eventCategoryName: "Book Club",
      eventCategoryIcon: Icons.menu_book_outlined,
      eventCategoryImg: "assets/images/category/Book Club.png",
    ),
    EventCategory(
        eventCategoryName: "Meeting",
        eventCategoryIcon: Icons.meeting_room_outlined,
        eventCategoryImg: "assets/images/category/Meeting.png"),
    EventCategory(
        eventCategoryName: "Holiday",
        eventCategoryIcon: Icons.holiday_village_outlined,
        eventCategoryImg: "assets/images/category/Holiday.png"),
    EventCategory(
      eventCategoryName: "Gaming",
      eventCategoryIcon: Icons.games_outlined,
      eventCategoryImg: "assets/images/category/Gaming.png",
    ),
    EventCategory(
      eventCategoryName: "Eating",
      eventCategoryIcon: Icons.set_meal_outlined,
      eventCategoryImg: "assets/images/category/Eating.png",
    ),
    EventCategory(
      eventCategoryName: "Work Shop",
      eventCategoryIcon: Icons.work_outlined,
      eventCategoryImg: "assets/images/category/Work Shop.png",
    ),
    EventCategory(
      eventCategoryName: "Exhibition",
      eventCategoryIcon: Icons.water_drop_rounded,
      eventCategoryImg: "assets/images/category/Exhibition.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create Event",
          style: TextStyle(
              color: AppColor.purpel,
              fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body:  DefaultTabController(
        length: 9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 205,
                       width: 375,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(16),
                         child: Image.asset( eventCategories[selectedTap].eventCategoryImg.toString(),
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     SizedBox(
                       height: 40,
                       child: TabBar(
                           isScrollable: true,
                           tabAlignment: TabAlignment.start,
                           indicatorColor: Colors.transparent,
                           dividerColor: Colors.transparent,
                           unselectedLabelColor: Colors.transparent,
                           labelPadding: EdgeInsets.symmetric(horizontal: 5),
                           indicator: const BoxDecoration(),
                           onTap: (value) {
                             setState(() {
                               selectedTap=value;
                             });

                           },
                           tabs:eventCategories.map(
                                 (element) {
                               return CustomTabBarAdd(
                                 eventCategory: element,
                                 isSelected:
                                 selectedTap == eventCategories.indexOf(element),
                               );
                             },
                           ).toList()),
                     ),

                     SizedBox(
                       height: 10,
                     ),
                     Text(
                       "Title",
                       style: TextStyle(
                         fontWeight: FontWeight.w500,
                         fontSize: 16,
                       ),
                     ),
                        CustomTextField(
                          controller: _titelcontroler,
                          hint: "Event Title",
                          hintColor: AppColor.gray,
                          prefixIcon:  Icon(
                            Icons.edit_note_outlined,
                            color: AppColor.gray,
                          ),
                          onValidate: (value) {
                            if(value==null||value.trim().isEmpty){
                              return"plz Enter the Title";
                            }
                            return null;
                          },
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                       "Description",
                       style: TextStyle(
                         fontWeight: FontWeight.w500,
                         fontSize: 16,
                       ),
                     ),
                     CustomTextField(
                       controller: _descriptioncontroler,
                       hint: "Event Description",
                       hintColor: AppColor.gray,
                       maxLines: 4,
                       onValidate: (value) {
                         if(value==null||value.trim().isEmpty){
                           return"plz Enter the Description";
                         }
                         return null;
                       },
                     ),
                     SizedBox(
                       height: 15,
                     ),
                     Row(
                       children: [
                         Icon(Icons.date_range),
                         SizedBox(
                           width: 10,
                         ),
                         Text(
                           "Event Date",
                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                         ),
                         Spacer(),
                         GestureDetector(
                           onTap: () {
                             selectEvenDate();
                           },
                           child: Text(
                             selectedDate!=null? DateFormat("dd MMM yyy").format(selectedDate!):
                             "Choose Date",
                             style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 16,
                                 color: AppColor.purpel),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 15,
                     ),
                     Row(
                       children: [
                         Icon(Icons.access_time_sharp),
                         SizedBox(
                           width: 10,
                         ),
                         Text(
                           "Event Time",
                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                         ),
                         Spacer(),
                         GestureDetector(
                           onTap: () {
                             selectEvenTime();
                           },
                           child: Text(
                             selectedTime!=null? selectedTime.toString():
                             "Choose Time",
                             style: TextStyle(
                                 fontWeight: FontWeight.w500,
                                 fontSize: 16,
                                 color: AppColor.purpel),
                           ),
                         ),
                       ],
                     ),
                     Spacer(),
                     Text(
                       "Location",
                       style: TextStyle(
                         fontWeight: FontWeight.w500,
                         fontSize: 16,
                       ),
                     ),
                     ElevatedButton(
                       onPressed: () {},
                       child: Row(
                         children: [
                           Container(
                             // width: 46,
                             // height: 46,
                             padding: EdgeInsets.all(12),
                             decoration: BoxDecoration(
                               color: AppColor.purpel,
                               borderRadius: BorderRadius.circular(8),
                             ),
                             child: Icon(
                               Icons.my_location_outlined,
                               color: AppColor.white,
                             ),
                           ),
                           SizedBox(
                             width: 10,
                           ),
                           Text(
                             "Choose Event Location",
                             style: TextStyle(
                                 color: AppColor.purpel,
                                 fontSize: 16,
                                 fontWeight: FontWeight.w500),
                           ),
                           Spacer(),
                           Icon(
                             Icons.arrow_forward_ios,
                             color: AppColor.purpel,
                           ),
                         ],
                       ),
                       style: ButtonStyle(
                         padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                         backgroundColor: WidgetStatePropertyAll(AppColor.white),
                         shape: WidgetStatePropertyAll(
                           RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(16),
                               side: BorderSide(color: AppColor.purpel)),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                   ],
                 ),
               ),
                ElevatedButton(
                  onPressed: () {
                    if(_formkey.currentState!.validate()){
                      if(selectedDate!=null){
                        if(selectedTime!=null){
                        var data=EventDataModel(
                          eventTitle: _titelcontroler.text,
                          eventImage: eventCategories[selectedTap].eventCategoryImg.toString(),
                          eventDescription: _descriptioncontroler.text,
                          eventCategory: eventCategories[selectedTap].eventCategoryName,
                          eventDate: selectedDate!,
                        );
                        EasyLoading.show();
                        FirebaseFireStoreService.createEvent(data).then(
                          (value) {
                            EasyLoading.dismiss();
                            SnackBarService.showSuccessMessage("Event Create Successfully");
                            navigatorKey.currentState!.pop();
                          },
                        );
                      }
                      }else{
                        SnackBarService.showErrorMessage("Selected Date & Time First");
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Event",
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColor.purpel),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void selectEvenDate()async{
    DateTime? currentDate= await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 365,),
        ),
    );
    setState(() {
      selectedDate=currentDate;
    });
  }
  void selectEvenTime()async{
    TimeOfDay? currentTime= await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );

    setState(() {
      selectedTime=currentTime;
    });
  }
}