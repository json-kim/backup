class RecipeAPIException with Exception {
  final String message;

  RecipeAPIException(this.message);

  @override
  String toString() {
    return message;
  }
}
