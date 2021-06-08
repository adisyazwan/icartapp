import 'package:flutter/material.dart';
import 'existing_cards.dart';
import 'payment-service.dart';
import 'package:progress_dialog/progress_dialog.dart';

class StripePayment extends StatefulWidget {
  StripePayment({Key key, this.totalPrice}) : super(key: key);

  final double totalPrice;
  @override
  StripePaymentState createState() => StripePaymentState();
}

class StripePaymentState extends State<StripePayment> {
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ExistingCardsPage()));
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: '15000', currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(response.message),
        duration: new Duration(
            milliseconds: response.success == true ? 1200 : 3000)));
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF5722),
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          title: Text('Payment total : RM' + widget.totalPrice.toString()),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  Icon icon;
                  Text text;
                  switch (index) {
                    case 0:
                      icon = Icon(Icons.add_circle, color: theme.primaryColor);
                      text = Text('Pay via new card');
                      break;
                    case 1:
                      icon = Icon(Icons.credit_card, color: theme.primaryColor);
                      text = Text('Pay via existing card');
                      break;
                  }
                  return InkWell(
                      onTap: () {
                        onItemPress(context, index);
                      },
                      child: ListTile(title: text, leading: icon));
                },
                separatorBuilder: (context, index) =>
                    Divider(color: theme.primaryColor),
                itemCount: 2)));
  }
}
