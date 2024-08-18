import 'package:dobe/constants/color_constants.dart';
import 'package:dobe/constants/text_constants.dart';
import 'package:dobe/model/dog_image.dart';
import 'package:dobe/reusable/loading_view.dart';
import 'package:dobe/reusable/screen_error_widget.dart';
import 'package:dobe/viewmodels/dog_details_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DogDetailsScreen extends StatefulWidget {
  const DogDetailsScreen({super.key,required this.breedName,this.subBreeds});
  final String breedName;
  final List<String>? subBreeds;

  @override
  State<DogDetailsScreen> createState() => _DogDetailsScreenState();
}

class _DogDetailsScreenState extends State<DogDetailsScreen> {

  DogDetailsViewModel? dogDetailsViewModel;
Future<DogImage>? getDogImage;
GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();

@override
  void initState() {

    dogDetailsViewModel=context.read<DogDetailsViewModel>();
getDogImage=dogDetailsViewModel?.getDogImageData( scaffoldKey,widget.breedName,context: context);
    // TODO: implement initState
          
              super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
centerTitle: true,
automaticallyImplyLeading: true,
      ),
      body: SafeArea(child: 
      
      Container(
        child: FutureBuilder(future: getDogImage, builder: (context,snapshot){
                   if(snapshot.connectionState==ConnectionState.waiting){
            return LoadingView();
          }else if(snapshot.hasError){
            return ScreenErrorWidget();
          }else if(snapshot.data!=null){
          return 
          
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Card(
                            color: ColorConstants.primaryColor,
                elevation: 5,
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Container(
                margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                 child: Hero(
                        tag: widget.breedName,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            height: MediaQuery.sizeOf(context).height / 2,
                            width: MediaQuery.sizeOf(context).width,
                            fit: BoxFit.cover,
                            imageUrl: snapshot.data?.message ?? '',
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
               ),
                    Padding(
                      padding: EdgeInsets.all(16),
                           child:   Container(
                                                                                          margin: EdgeInsets.symmetric(horizontal: 10),
              
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text('Breed Name: ${widget.breedName}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),),
                              ),
              
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    //padding: EdgeInsets.all(8),
                    child: Text(
                    widget.subBreeds != null && widget.subBreeds!.isNotEmpty?  'Sub Breeds: ':'No Sub Breeds Found',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
                    ),
                  ),
                  if (widget.subBreeds != null && widget.subBreeds!.isNotEmpty)
                    Expanded(
                      child: SizedBox(
                        height: 100, // Set a fixed height
                        child: ListView.builder(
              scrollDirection: Axis.horizontal,
             // padding: EdgeInsets.all(6.0), // padding around the grid
              itemCount: widget.subBreeds!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    label: Text(
                      widget.subBreeds![index],
                      overflow: TextOverflow.ellipsis, // Adds the ellipsis
                      maxLines: 1, // Ensure the text stays on a single line
                    ),
                  ),
                );
              },
                        ),
                      ),
                    ),
                ],
              ),
              
              
                       Padding(
                      padding: EdgeInsets.all(16),
                           child:   Container(
                                                                                          margin: EdgeInsets.symmetric(horizontal: 10),
              
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text('Info: ${TextConstants.dogInfoMessage}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),),
                              ),
              
                    ),   
              
              
                ],
              ),
            ),
          );
          

          }else{
            return Center(child: Text('Some Error Occured Please Try Again Later'),);
          }
        },),

         
         

        
      )
      ),
    );
  }
}