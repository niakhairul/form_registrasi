import 'package:flutter/material.dart';

class FormPendaftaranScreen extends StatefulWidget {
  const FormPendaftaranScreen({super.key});

  @override
  State<FormPendaftaranScreen> createState() => _FormPendaftaranScreenState();
}

class _FormPendaftaranScreenState extends State<FormPendaftaranScreen> {
  final _formKey = GlobalKey<FormState>();

  final namaC = TextEditingController();
  final emailC = TextEditingController();
  final hpC = TextEditingController();
  final alamatC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Pendaftaran")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaC,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (v){
                  if(v == null || v.isEmpty) return "Nama tidak boleh kosong";
                  return null;
                },
              ),

              TextFormField(
                controller: emailC,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (v){
                  if(v == null || v.isEmpty) return "Email tidak boleh kosong";
                  if(!v.contains("@")) return "Format email tidak valid";
                  return null;
                },
              ),

              TextFormField(
                controller: hpC,
                decoration: const InputDecoration(labelText: "Nomor HP"),
                keyboardType: TextInputType.phone,
                validator: (v){
                  if(v == null || v.isEmpty) return "Nomor HP tidak boleh kosong";
                  if(v.length <= 10) return "Nomor HP harus lebih dari 10 angka";
                  return null;
                },
              ),

              TextFormField(
                controller: alamatC,
                decoration: const InputDecoration(labelText: "Alamat"),
                validator: (v){
                  if(v == null || v.isEmpty) return "Alamat tidak boleh kosong";
                  return null;
                },
              ),

              TextFormField(
                controller: passC,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (v){
                  if(v == null || v.isEmpty) return "Password tidak boleh kosong";
                  if(v.length <= 3) return "Password harus lebih dari 3 karakter";
                  return null;
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                child: const Text("DAFTAR"),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("OK, semua valid!"))
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}