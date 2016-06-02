class PowerUp {
  //List of powerups
  int x, y;
  String name;
  Boolean isOccupied;

  //general bombs for all players w/o powerups
  PowerUp(String powerUpType, Boolean filled, int x, int y) {
    this.name = powerUpType;
    isOccupied = filled;
    this.x = x;
    this.y = y;
  }
}