let Component = import("./Component");

let TileCollider = {
    create = => {
        return { 
            layer = 0,
            padding = { h = 5.0, v = 5.0 },
            colliding = {
                top = false,
                bottom = false,
                left = false,
                right = false,
                bottomRight = false,
                bottomLeft = false
            }
         } @ TileCollider;
    },

    isColliding = -> {
        return this.colliding;
    },

    getType = -> {
        return "TileCollider";
    }
} @ Component.create();

return TileCollider;