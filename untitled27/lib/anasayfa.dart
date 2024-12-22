import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled27/anasayfa_cubit.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var tfSayi1= TextEditingController();
  var tfSayi2= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Kullanimi'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 48.0,right: 48.0),
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit,int>
                (builder: (context,sonucc){
                  return Text(sonucc.toString(),style: const TextStyle(fontSize: 30.0),);

              }),
              TextField(
                controller: tfSayi1,
                decoration: InputDecoration(
                  hintText: 'Sayi1',

                ),
              ),
              TextField(
                controller: tfSayi2,
                decoration: InputDecoration(
                  hintText: 'Sayi2',

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ElevatedButton(onPressed: () {
                String alinanSayi1 = tfSayi1.text;
                String alinanSayi2 = tfSayi2.text;
                context.read<AnasayfaCubit>().toplama(alinanSayi1, alinanSayi2);

                }, child: Text('Toplama')),

                ElevatedButton(onPressed: () {
                  String alinanSayi1 = tfSayi1.text;
                  String alinanSayi2 = tfSayi2.text;

                  context.read<AnasayfaCubit>().carpma(alinanSayi1, alinanSayi2);

                }, child: Text('Çarpma')),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}
