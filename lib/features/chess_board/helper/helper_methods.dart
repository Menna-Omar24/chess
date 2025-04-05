bool isWhite(int index) {
  int row = index ~/ 8; // Get the row number
  int col = index % 8;  // Get the column number
  return (row + col) % 2 == 0; // Check if the sum is even
}

bool isInBoard(int row, int col) {
  return row >= 0 && row < 8 && col >= 0 && col < 8;
}
