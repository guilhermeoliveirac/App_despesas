class Transaction{
  final String identidade;
  final String title;
  final double value;
  final DateTime data;
  
  Transaction({
    required this.identidade,
    required this.data,
    required this.value,
    required this.title,
  });
}