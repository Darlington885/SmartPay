
import 'package:flutter/cupertino.dart';
import 'package:smartpay/widgets/progressFile.dart';

import '../classes/colors.dart';

class LoaderProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ProgressBar _progressBar = ProgressBar();

  show(BuildContext context) {
    _progressBar.show(context);
  }

  hide() {
    _progressBar.hide();
  }
}


// final loaderOne = Padding(
//   padding: const EdgeInsets.all(18.0),
//   child: SpinKitFadingCircle(
//     color: AppColor.primarySecondaryColor,
//     size: 50.0,
//   ),
// );
//
// final loaderTwo = Padding(
//   padding: const EdgeInsets.all(18.0),
//   child: SpinKitFadingCircle(
//     color: Colors.white,
//     size: 30.0,
//   ),
// );

const loaderOne = Padding(
  padding: EdgeInsets.all(18.0),
  child: Center(
    child: CupertinoActivityIndicator(
      color: AppColor.colorApp,
      radius: 13,
    ),
  ),
);

const loaderTwo = Padding(
  padding: EdgeInsets.all(18.0),
  child: Center(
    child: CupertinoActivityIndicator(
      radius: 13,
    ),
  ),
);
