import java.awt.Image;

public class TileMap {
    private Tiles[][] tiles;
    /**
    Creates a new TileMap with the specified width and
    height (in number of tiles) of the map.
    */
    public TileMap(int width, int height) {
        tiles = new Tiles[width][height];
    }
    /**
    Gets the width of this TileMap (number of tiles across).
    */
    public int getWidth() {
        return tiles.length;
    }
    /**
    Gets the height of this TileMap (number of tiles down).
    */
    public int getHeight() {
        return tiles[0].length;
    }
    /**
    Gets the tile at the specified location. Returns null if
    no tile is at the location or if the location is out of
    bounds.
    */
    public Tiles getTile(int x, int y) {
        if (x < 0 || x >= getWidth() ||
            y < 0 || y >= getHeight())
        {
            return null;
        }
        else {
            return tiles[x][y];
        }
    }
    /**
    Sets the tile at the specified location.
    */
    public void setTile(int x, int y, Tiles tile) {
        tiles[x][y] = tile;
    }
}