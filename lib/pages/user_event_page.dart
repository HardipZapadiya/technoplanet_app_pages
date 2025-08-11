import 'package:flutter/material.dart';

class EventUser extends StatelessWidget {
  
   EventUser({super.key});
  void update_event(){
    //code to update event
  }

  bool delete_event(){
    //code
    //code to delete event
    return true;
  }
  


  Padding update_delete_button() {
     return Padding(
               padding: const EdgeInsets.only(left: 40,right: 40,top: 0,bottom: 20),
               child: Column(
                 children: [
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        
                      ),
                     child: ElevatedButton(
                      style: customButtonStyle(
                        borderColor: Colors.transparent,
                        textColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                      ),
                       onPressed: () => update_event(), 
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.edit_outlined, color: Colors.white, size: 24),
                           SizedBox(width: 12),
                           Text("Update Event",),
                         ],
                       ),

                     ),
                   ),
                  SizedBox(height: 20,),
                  Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        
                      ),
                     child: ElevatedButton(
                      style:  customButtonStyle(
                                borderColor: Colors.blueAccent,
                                textColor: Colors.blueAccent,
                                backgroundColor: Colors.white.withOpacity(0.2),
),
                       onPressed: () => delete_event(), 
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Icon(Icons.delete_outline, color: Colors.blueAccent, size: 24),
                             SizedBox(width: 12),
                             Text("Delete Event", ),
                           ],
                        ),

                                              ),
                   ),
                 ],
               ),
             );
   }
  
  Row back_arrow_button() {
    return Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Your action here
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                  label: Text(
                    'Back',
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            );
  }

  ButtonStyle customButtonStyle({
  required Color borderColor,
  required Color textColor,
  required Color backgroundColor,
}) {
  return ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(backgroundColor),
    foregroundColor: WidgetStatePropertyAll(textColor),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: borderColor, width: 2),
      ),
    ),
    textStyle: WidgetStatePropertyAll(
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    elevation: WidgetStatePropertyAll(0),
  );
}

  //data from database

   final List<String> about_event_text=["In the heart of every sunrise lies a chance to begin again. Whether the day holds routine tasks or unexpected adventures, it reminds us that progress is stitched together from small steps. Moments of quiet reflection, paired with action, shape our stories over time. We often overlook the beauty in persistence, yet it's this steady effort that builds mastery. Challenges aren't barriers—they're invitations to grow stronger, think deeper, and try again. So embrace each task not for what it demands, but for what it teaches. In doing so, you become more than skilled—you become resilient, curious, and truly alive.",];
  
   final List<String> description_points = [
     "Participants will compete in teams of 2-3 members",
     "Each team will be given a coding problem to solve",
     "Teams must write code without seeing the output",
     "Time limit: 2 hours for problem solving",
     "Use of internet is strictly prohibited",
     "Teams can use any programming language",
     "Judging based on code efficiency and correctness",
     "Top 3 teams will receive exciting prizes",
     "Free snacks and refreshments provided",
     "Networking session after the competition"
   ];
   
   final List<String> rules_points = [
     "All participants must register before the event",
     "Teams must arrive 15 minutes before start time",
     "No external devices or calculators allowed",
     "All code must be written in the provided IDE",
     "Teams cannot communicate with other teams",
     "No use of pre-written code or libraries",
     "All team members must actively participate",
     "Decisions of judges are final",
     "Violation of rules leads to disqualification",
     "Event organizers reserve all rights"
   ];

   final List<String> judging_criteria_points = [
     "All participants must register before the event",
     "Teams must arrive 15 minutes before start time",
     "No external devices or calculators allowed",
     "All code must be written in the provided IDE",
     "Teams cannot communicate with other teams"];

   final String img_url="https://tse1.mm.bing.net/th/id/OIP.3moDhGXJQx9PQekpJFkHpgHaFf?pid=Api&P=0&h=180";

   final String date_event="29/10/2005";
   final String place_event="Seminar Hall";
   final String name_event="Blind Coding";
   final String time_evemt="8:00pm";
   final String participants_event="120";
   final bool isBookmarkedInitially = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    //image url
    //data from database
    //final date,time,participant,event_place,event_name;

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          "assets/Vector4.png",
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  back_arrow_button(),BookmarkToggleButton(isBookmarkedInitially: isBookmarkedInitially),
                ],
              ),
              SizedBox(height: isTablet ? 80 : 50,),
              ProportionalImage(imageUrl: img_url),
              EventDetails(date: date_event, time: time_evemt,participant: participants_event,event_place: place_event,event_name: name_event,),
              SizedBox(height: 20,),
              update_delete_button(),
              EventInfo(criteriaPoints: about_event_text, title: "About", icon:Icons.info_outline,),
              EventInfo(criteriaPoints: description_points, title: "Description", icon:Icons.description_outlined,),
              EventInfo(criteriaPoints: rules_points, title: "Rules", icon: Icons.rule,),
              EventInfo(criteriaPoints: judging_criteria_points, title: "Judging Criteria", icon: Icons.check_circle_outline,),
              GalleryCoordinator(),
              SizedBox(height: 30,),

            ], 
            ),
          ),
        ),
      ],
      ),
    );
  }
}

class ProportionalImage extends StatefulWidget {
  final String imageUrl;
  const ProportionalImage({required this.imageUrl});

  @override
  State<ProportionalImage> createState() => _ProportionalImageState();
}

class _ProportionalImageState extends State<ProportionalImage> {
  bool _loading = true;
  Image? _image;
  double? _aspectRatio;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() {
    _image = Image.network(widget.imageUrl);
    _image!.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((info, _) {
        setState(() {
          _aspectRatio = info.image.width / info.image.height;
          _loading = false;
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final isTablet = deviceWidth > 600;
    final isDesktop = deviceWidth > 900;
    
    final containerWidth = isDesktop ? deviceWidth * 0.7 : deviceWidth -10;
    final containerHeight = containerWidth / (_aspectRatio ?? 1) - (isTablet ? 40 : 30);

    return _loading
        ? Container(
            width: containerWidth,
            height: containerHeight,
            child: Center(child: Text("Loading image..."))
          )
        : Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.5), width: isTablet ? 15 : 10),
              borderRadius: BorderRadius.circular(isTablet ? 50 : 40),
            ),
            clipBehavior: Clip.antiAlias, // Prevents image overflow
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isTablet ? 35 : 30),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover, // Covers the container completely
              ),
            ),
          );
  }
}

class EventInfo extends StatefulWidget {
  final List<String> criteriaPoints;
  final String title;
  final IconData icon;

  const EventInfo({
    required this.criteriaPoints,
    required this.title,
    required this.icon,
  });

  @override
  _EventInfoState createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    return Container(
      padding: EdgeInsets.only(
        left: isDesktop ? 60 : isTablet ? 50 : 40,
        right: isDesktop ? 60 : isTablet ? 50 : 40,
        bottom: isDesktop ? 60 : isTablet ? 50 : 20,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.1), width: 1),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(44, 127, 243, 0.098),
                  Color.fromRGBO(44, 127, 243, 0.098),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  color: Colors.blueAccent,
                  size: isDesktop ? 32 : isTablet ? 30 : 28,
                ),
                SizedBox(width: 15),

                Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: isDesktop ? 30 : isTablet ? 28 : 19,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueAccent,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),

                
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 150, 243, 0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    icon: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: isDesktop ? 35 : isTablet ? 32 : 30,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          _isExpanded
              ? Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.05),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.1), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.criteriaPoints.map((point) => Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8, right: 15),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueAccent, Colors.blueAccent],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(33, 150, 243, 0.3),
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: TextStyle(
                                fontSize: isDesktop ? 18 : isTablet ? 17 : 16,
                                height: 1.5,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )).toList(),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class EventDetails extends StatelessWidget {
  final String date, time, participant, event_place, event_name;
  const EventDetails({
    super.key,
    this.date = "",
    this.time = "",
    this.participant = "",
    this.event_place = "",
    this.event_name = "",
  });

  Container participants(double fontSize) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.groups, color: Colors.grey[800]),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "$participant Participants",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: fontSize ,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container time_date(double fontSize) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.access_alarm, color: Colors.grey[800], size: fontSize + 10),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: fontSize - 2,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: fontSize - 2,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container event(double fontSize) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Text(
              event_name,
              style: TextStyle(
                fontSize: fontSize ,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container place(double fontSize) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.meeting_room_rounded, size: fontSize + 5, color: Colors.grey[800]),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              event_place,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    final containerWidth = isDesktop
        ? screenWidth * 0.6
        : isTablet
            ? screenWidth * 0.75
            : screenWidth * 0.9;

    final baseFontSize = isDesktop
        ? 16.0
        : isTablet
            ? 14.0
            : 12.0;

    return Container(
      width: containerWidth,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [

          Row(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 20,), 
              Expanded(
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    event(baseFontSize+4),
                    SizedBox(height: 10),
                    time_date(baseFontSize),
                  ],
                ),
              ),
              SizedBox(width: isTablet ? 40 : 20),
              Expanded(
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    participants(baseFontSize),
                    SizedBox(height: 10),
                    place(baseFontSize),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GalleryCoordinator extends StatelessWidget {
  // Method to run when "Coordinators" is tapped
  void onCoordinatorsTap() {
    print("Coordinators tapped!");
    // Add your logic here
  }

  // Method to run when "View Image Gallery" is tapped
  void onGalleryTap() {
    print("View Image Gallery tapped!");
    // Add your logic here
  }

  @override
  Widget build(BuildContext context) {
    return
         Center(
          child: Container(
            padding: EdgeInsets.only(left: 40,right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                    color: const Color.fromARGB(255, 137, 165, 222),
                    thickness: 2,
                    height: 40,
                    indent: 0,
                    endIndent: 0,
                  ),

                // Coordinators Row with tap
                InkWell(
                  onTap: onCoordinatorsTap,
                  child: Row(
                    children: [
                      Icon(Icons.group, color: Colors.blue, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Coordinators',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Gallery Row with tap
                InkWell(
                  onTap: onGalleryTap,
                  child: Row(
                    children: [
                      Icon(Icons.photo, color: const Color.fromARGB(255, 62, 67, 74), size: 40),
                      SizedBox(width: 10),
                      Text(
                        'View Image Gallery',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) 
    ;
  }
}


class BookmarkToggleButton extends StatefulWidget {
  final bool isBookmarkedInitially;

  const BookmarkToggleButton({Key? key, required this.isBookmarkedInitially})
      : super(key: key);

  @override
  _BookmarkToggleButtonState createState() => _BookmarkToggleButtonState();
}

class _BookmarkToggleButtonState extends State<BookmarkToggleButton> {
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.isBookmarkedInitially;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(right: 10.0),
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: isBookmarked ? Colors.blueAccent : Colors.black54,
        size: 30,
      ),
      tooltip: isBookmarked ? 'Remove Bookmark' : 'Add Bookmark',
      onPressed: () {
        setState(() {
          isBookmarked = !isBookmarked;
        });
      },
    );
  }
}
