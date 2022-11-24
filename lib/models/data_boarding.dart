class DataBoarding{
  final String title, commentText, image;
    DataBoarding({
      required this.title,
      required this.commentText,
      required this.image
    });

}

List<DataBoarding> data_boarding = [
  DataBoarding(
      title: "Easy, Fast & Trusted",
      commentText: "Fast money transfer and gauranteed safe transactions with others.",
      image: "assets/images/fast-loading.png",
  ),
  DataBoarding(
    title: "Saving Your Money",
    commentText: "Track the progress of your savings and start a habit of saving with Payvand.",
    image: "assets/images/savings-pana.png",
  ),
  DataBoarding(
    title: "Free Transactions",
    commentText: "Provides the quality of the financial system with free money transactions without any fees.",
    image: "assets/images/payments-rafiki.png",
  ),
  DataBoarding(
    title: "International Transactions",
    commentText: "Provides the 100% freedom of the financial management with lowest fees on International transactions.",
    image: "assets/images/currency-rafiki.png",
  ),
  DataBoarding(
    title: "Multiple Credit Cards",
    commentText: "Provides the 100% freedom of the financial management with Multiple Payment Options for local & International Payments.",
    image: "assets/images/wallet-amico.png",
  ),
  DataBoarding(
    title: "Bills Payment Made Easy",
    commentText: "Pay monthly or daily bills at home in a site of Payvand.",
    image: "assets/images/card-pana.png",
  ),
  DataBoarding(
    title: "Color Your Cards",
    commentText: "Provides better cards management when using Multiple Cards by using a different color for each payment method.",
    image: "assets/images/group64.png",
  ),

];