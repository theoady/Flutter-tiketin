part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final HistoryTransaction transaction;

  SuccessPage(this.ticket, this.transaction);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF0F1240),
        body: FutureBuilder(
            future: ticket != null
                ? processingTicketOrder(context)
                : processingTopUp(),
            builder: (_, snapshot) => (snapshot.connectionState ==
                    ConnectionState.done)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.only(bottom: 70),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ticket == null
                                      ? "assets/ill_top_up.png"
                                      : "assets/ill_tickets.png"))),
                        ),
                        Text(
                          (ticket == null) ? "Topup Success" : "Happy Watching",
                          style: whiteTextFont.copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          (ticket == null)
                              ? "You have successfully\ntopup the wallet"
                              : "You have successfully\nbought the ticket",
                          textAlign: TextAlign.center,
                          style: whiteTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                        Container(
                            height: 45,
                            width: 250,
                            margin: EdgeInsets.only(top: 70, bottom: 20),
                            child: RaisedButton(
                              elevation: 0,
                              color: secondarypink,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                (ticket == null) ? "My Wallet" : "My Tickets",
                                style: whiteTextFont.copyWith(fontSize: 16),
                              ),
                              onPressed: () {
                                if (ticket == null) {
                                  context
                                      .bloc<PageBloc>()
                                      .add(GoToWalletPage(GoToMainPage()));
                                } else {
                                  context
                                      .bloc<PageBloc>()
                                      .add(GoToMainPage(bottomNavBarIndex: 1));
                                }
                              },
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Discover new movie? ",
                              style: greyTextFont.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToMainPage());
                              },
                              child: Text(
                                "Back to Home",
                                style: pinkTextFont,
                              ),
                            )
                          ],
                        )
                      ])
                : Center(
                    child: SpinKitFadingCircle(
                    color: mainColor,
                    size: 50,
                  ))),
      ),
    );
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(ticket.totalPrice));
    context.bloc<TicketBloc>().add(BuyTicket(ticket, transaction.userID));

    await HistoryTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp() async {}
}
