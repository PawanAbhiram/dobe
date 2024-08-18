import 'package:dobe/constants/color_constants.dart';
import 'package:dobe/model/dog_breeds.dart';
import 'package:dobe/reusable/loading_view.dart';
import 'package:dobe/reusable/screen_error_widget.dart';
import 'package:dobe/routes/routes.dart';
import 'package:dobe/routes/routes_names.dart';
import 'package:dobe/screens/coming_soon_screen.dart';
import 'package:dobe/utils/snackbar_utils.dart';
import 'package:dobe/viewmodels/dog_details_viewmodel.dart';
import 'package:dobe/viewmodels/dog_list_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DogBreedListScreen extends StatefulWidget {
  const DogBreedListScreen({super.key});

  @override
  State<DogBreedListScreen> createState() => _DogBreedListScreenState();
}

class _DogBreedListScreenState extends State<DogBreedListScreen> {

  DogListViewModel? viewModel;
  Future<DogBreeds>? getDogListData;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  DogDetailsViewModel? getDogImageViewModel;

  @override
  void initState() {
    viewModel = context.read<DogListViewModel>();
    getDogImageViewModel = context.read<DogDetailsViewModel>();
    getDogListData = viewModel?.getDogList(scaffoldKey, context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Dog Breeds'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: (){
              SnackBarUtils.showSnackBar(context,message: 'Filters Coming Soon');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: ColorConstants.primaryColor,
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Wishlist'),
              onTap: () {
                Navigator.pushNamed(context, RouteNames.comingSoonScreen);

//                Navigator.pop(context); // Close the drawer
                // Navigate to Wishlist Screen
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Version'),
              onTap: () {
                                Navigator.pushNamed(context, RouteNames.comingSoonScreen);

               // Navigator.pop(context); // Close the drawer
                // Show version information
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                             Navigator.pushNamed(context, RouteNames.comingSoonScreen);

             //   Navigator.pop(context); // Close the drawer
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: getDogListData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingView();
              } else if (snapshot.hasError) {
                return ScreenErrorWidget();
              } else if (snapshot.data != null) {
                final breedKeys = snapshot.data!.breeds?.keys.toList() ?? [];

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery.sizeOf(context).height / 3.7,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  padding: EdgeInsets.all(6.0),
                  itemCount: breedKeys.length,
                  itemBuilder: (context, index) {
                    final breedName = breedKeys[index];
                    final subBreeds = snapshot.data!.breeds?[breedName] ?? [];

                    return InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteNames.dogDetailsScreen,
                        arguments: {
                          'breed_name': breedName,
                          'sub_breeds': subBreeds,
                        },
                      ),
                      child: Card(
                        color: ColorConstants.primaryColor,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: breedName,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/images/default_dog.webp',
                                  height: 120.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(4),
                              child: Text(
                                breedName,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              alignment: subBreeds.isNotEmpty ? Alignment.centerLeft : Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                subBreeds.isNotEmpty
                                  ? 'Sub-breeds: ${subBreeds.join(', ')}'
                                  : 'No Sub-breeds',
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );

              } else {
                return Center(
                  child: Text('Some Error Occurred Please Try Again Later'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
