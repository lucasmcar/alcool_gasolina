import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  void _calcular(){

    double precoAlcool = double.parse( _controllerAlcool.text );
    double precoGasolina = double.parse( _controllerGasolina.text );

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _resultado = "Número inválido, digite numeros maiores que 0 e utilize (.)";
      });
    } else {
      if((precoAlcool / precoGasolina >= 0.7)){
        setState(() {
          _resultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _resultado = "Melhor abastecer com alcool";
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Image.asset("images/logo.png")
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Saiba qual é a melhor opção de abastecimento para seu carro",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.all(16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Álcool, ex: 1.59"
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerAlcool,
                ),
              ),
              Padding(padding: EdgeInsets.all(16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Gasolina, ex: 3.59"
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerGasolina,
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    child: Text("Calcular"),
                    onPressed: _calcular ,
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(top:15),
                  child: Text(_resultado,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
