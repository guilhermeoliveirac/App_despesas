class Transaction{
  final String identidade;
  final String title;
  final double value;
  final DateTime date;
  
  Transaction({
    required this.identidade,
    required this.date,
    required this.value,
    required this.title,
  });
}