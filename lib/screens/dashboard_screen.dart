import 'package:flutter/material.dart';
import 'package:housy_inter_task_2/components/authentication/custom_text_button.dart';
import 'package:housy_inter_task_2/model/movie.dart';
import 'package:housy_inter_task_2/services/networking.dart';
import 'package:housy_inter_task_2/utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = 'dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool success = false;
  bool? isSuccess1;
  bool? isSuccess2;
  void buildCompanyDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: kCardBackgroundColor,
        title: Center(child: Text('Company Detail')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Company: Housy'),
            Text('Address: Pune,India'),
            Text('Phone: XXXXXXXX09'),
            Text('Email: XXXXX@housy.com'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCardBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButton(
            color: kCardBackgroundColor,
            onSelected: (value) => buildCompanyDetailDialog(context),
            itemBuilder: (BuildContext context) {
              return {
                'Company Details',
              }.map(
                (String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice),
                  );
                },
              ).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              success ? Icons.check_circle_outline : Icons.cancel_outlined,
              size: 120.0,
              color: success ? Colors.green : Colors.red,
            ),
            Visibility(
              visible: success,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: Text(
                '2 POST request success',
                style: TextStyle(color: Colors.greenAccent),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: 100,
              height: 80,
              child: CustomTextButton(
                buttonTitle: 'Post',
                callback: () async {
                  isSuccess1 = await Networking().postData(
                    Movie(
                      title: 'Bond 25',
                      director: 'Cary Joji Fukunaga',
                      genre: ['Action', 'Adventure', 'Thriller'],
                      starring: ['Ana de Armas', 'Rami'],
                      language: 'English',
                      releaseDate: '2 Apr',
                      views: '137',
                      vote: '1',
                    ),
                  );
                  isSuccess2 = await Networking().postData(
                    Movie(
                      title: 'The New Mutants',
                      director: 'Josh Boone',
                      genre: ['Action', 'Horror', 'Scifi'],
                      starring: ['Blue Hunt', 'Charlie Heat'],
                      language: 'English',
                      releaseDate: '1 Apr',
                      views: '127',
                      vote: '1',
                    ),
                  );
                  setState(() {
                    isSuccess1! && isSuccess2!
                        ? success = true
                        : success = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
