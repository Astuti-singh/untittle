import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyApplication(),
  ));
}
class MyApplication extends StatefulWidget
{
  const MyApplication({super.key});
  @override
  State<StatefulWidget> createState() => Image_Picker();
}

class Image_Picker extends State<StatefulWidget> {
  File? selected_image;
  Future getImage(ImageSource source) async
  {
    try
    {
      final image=await ImagePicker().pickImage(source: source);
      if(image==null) return;
     // final image_temporary= File(image!.path);

      final image_saved=await savefile_memory(image.path);

      setState(() {
        this.selected_image=image_saved;
      });
    }on PlatformException catch(e)
    {
      print('Image can not be taken : $e');
    }
  }

  Future<File> savefile_memory(String storagepath) async
  {
    final directoty=await getApplicationDocumentsDirectory();
    final name=basename(storagepath);
    final image1=File('${directoty.path}/$name');
    return File(storagepath).copy(image1.path);
  }





  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Image Picker"),
     ),
     body: Column(
       children: [


         Container(
           margin: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
           child:  selected_image!=null? Image.file(selected_image!,height: 300,fit: BoxFit.contain,):
           Image.network('https://rrtutors.com/uploads/langpostimg/PickImage.png'),

         ),

         CustomButton(tittle: 'Pick Image from Gallery', iconData: Icons.image_outlined,onclick: ()=> getImage(ImageSource.gallery)),
         CustomButton(tittle: 'Pick Image from Camera', iconData: Icons.camera,onclick: ()=>getImage(ImageSource.camera),),
       ],
     ),
   );
  }


}
Widget CustomButton({required String tittle,required IconData iconData,required VoidCallback onclick})
{
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
    child: ElevatedButton(onPressed: onclick,
        child: Row
          (
          children: [
            Icon(iconData),
            SizedBox(width: 20,),
            Text(tittle),
          ],
        )
    ),
  );
}