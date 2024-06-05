import 'package:api/api.dart';
import 'package:api/repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Uzum Market'),
      ),
       body: FutureBuilder(
           future: _repository.getProducts(),
           builder: (context, snapshot) => ListView.separated(
             itemCount: snapshot.data?.length ?? 0,
             separatorBuilder: (context, index) => const Divider(),
             itemBuilder: (context, index) {
               final product = snapshot.data?[index];
               return Card(
                 surfaceTintColor: Colors.white,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12)
                 ),
                 child: ListTile(
                   leading: Container(
                     decoration: const BoxDecoration(
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)
                     ),),
                     child: CachedNetworkImage(
                         imageUrl: product?.image ?? '',
                       fit: BoxFit.cover,
                       placeholder: (context, url) => const SizedBox(
                         height: 30,
                         child: CupertinoActivityIndicator(),
                       ),
                       errorWidget: (context, url, error) => const Icon(Icons.error),
                     ),
                   ),
                   title: Text(product?.title ?? ''),
                   subtitle: Text(product?.category ?? ''),
                   trailing: Text('${product?.price}\$', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                 ),
               );
             }
           )
       )
    );
  }
}
