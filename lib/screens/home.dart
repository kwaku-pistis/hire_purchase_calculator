import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final _formatter = CurrencyTextInputFormatter();
  final _controller = TextEditingController();

  int _thirtyPercentAmount = 0;
  int _thirtyPercentDepositAmount = 0;
  int _thirtyPercentAmountLeftToPay = 0;
  int _fiftyPercentAmount = 0;
  int _fiftyPercentDepositAmount = 0;
  int _fiftyPercentAmountLeftToPay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hire Purchase Calculator',
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 50,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      isDense: true,
                      prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'GHS ',
                            style: TextStyle(
                              color: Colors.purple,
                              fontFamily: 'Lato',
                            ),
                          )),
                      prefixIconConstraints:
                          BoxConstraints(minHeight: 0, minWidth: 0),
                      hintText: '5000',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: 'Lato'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _thirtyPercentAmount =
                            _calc30PercentValue(int.parse(_controller.text));
                        _fiftyPercentAmount =
                            _calc50PercentValue(int.parse(_controller.text));
                      });
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(8),
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    child: const Text(
                      'CALCULATE',
                      style: TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _thirtyPercentView(),
                _fiftyPercentView()
              ],
            ),
          ],
        ),
      ),
    );
  }

  _thirtyPercentView() {
    return Column(
      children: [
        const Text(
          '30%',
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.purple,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          // height: MediaQuery.of(context).size.width * 0.45,
          child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'GHS $_thirtyPercentAmount',
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 24,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Deposit: ',
                          style: TextStyle(
                            fontFamily: 'Lato',
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.purple,
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Text(
                            'GHS $_thirtyPercentDepositAmount',
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'To Pay: ',
                          style: TextStyle(
                            fontFamily: 'Lato',
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.purple,
                          ),
                          padding: const EdgeInsets.all(7),
                          child: Text(
                            'GHS $_thirtyPercentAmountLeftToPay',
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'GHS ${(_thirtyPercentAmountLeftToPay / 6).round()} per month',
                      style: const TextStyle(fontFamily: 'Lato'),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }

  _fiftyPercentView() {
    return Column(
      children: [
        const Text(
          '50%',
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.purple,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          // height: MediaQuery.of(context).size.width * 0.45,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'GHS $_fiftyPercentAmount',
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 24,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Deposit: ',
                        style: TextStyle(
                          fontFamily: 'Lato',
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.purple,
                        ),
                        padding: const EdgeInsets.all(7),
                        child: Text(
                          'GHS $_fiftyPercentDepositAmount',
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'To Pay: ',
                        style: TextStyle(
                          fontFamily: 'Lato',
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.purple,
                        ),
                        padding: const EdgeInsets.all(7),
                        child: Text(
                          'GHS $_fiftyPercentAmountLeftToPay',
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'GHS ${(_fiftyPercentAmountLeftToPay / 6).round()} per month',
                    style: const TextStyle(fontFamily: 'Lato'),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _calc30PercentValue(int amount) {
    const hirePurchasePercentage = 0.2;
    const partPaymentPercentage = 0.3;
    double depositAmount = 0.0;
    double hirePurchaseAmount = 0.0;

    // get the deposit amount
    depositAmount = amount * partPaymentPercentage;

    /// the remaining amount left to pay
    /// it is on this one that we calculate the hire purchase amount left
    var amountLeft = amount - depositAmount;
    // amount of the hire purchase on the remaining amount left to pay
    hirePurchaseAmount = (amountLeft * hirePurchasePercentage) + amountLeft;
    // final amount to pay
    var hirePurchaseValue = hirePurchaseAmount + depositAmount;
    var amountLeftToPay = hirePurchaseValue - depositAmount;

    // set amounts
    setState(() {
      _thirtyPercentDepositAmount = depositAmount.round();
      _thirtyPercentAmountLeftToPay = amountLeftToPay.round();
    });

    return int.parse(hirePurchaseValue.round().toString());
  }

  _calc50PercentValue(int amount) {
    const hirePurchasePercentage = 0.2;
    const partPaymentPercentage = 0.5;
    double depositAmount = 0.0;
    double hirePurchaseAmount = 0.0;

    // get the deposit amount
    depositAmount = amount * partPaymentPercentage;

    /// the remaining amount left to pay
    /// it is on this one that we calculate the hire purchase amount left
    var amountLeft = amount - depositAmount;
    // amount of the hire purchase on the remaining amount left to pay
    hirePurchaseAmount = (amountLeft * hirePurchasePercentage) + amountLeft;
    // final amount to pay
    var hirePurchaseValue = hirePurchaseAmount + depositAmount;
    var amountLeftToPay = hirePurchaseValue - depositAmount;

    // set amounts
    setState(() {
      _fiftyPercentDepositAmount = depositAmount.round();
      _fiftyPercentAmountLeftToPay = amountLeftToPay.round();
    });

    return int.parse(hirePurchaseValue.round().toString());
  }
}
