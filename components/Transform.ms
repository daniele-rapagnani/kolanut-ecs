let Component = import("./Component");

let Transform = {
    create = => {
        return { 
            position = Vector2.create(), 
            angle = 0.0, 
            scale = Vector2.create(1.0, 1.0),
            origin = Vector2.create(),
            transform = Kolanut.Transform3D.create(),
            children = [],
            parent = null,
            worldTransform = Kolanut.Transform3D.create(),
            worldTransformDirty = false,
            quadtreeDirty = true,
            inQuadTree = false
        } @ Transform;
    },

    addChild = |e| -> {
        this.children[] = e.Transform;
        e.Transform.parent = this;
    },

    getChildren = -> {
        return children;
    },

    setWorldPosition = |pos| -> {
        let wt = this->getWorldTransform();
        let iwt = wt->copy();
        iwt->inverse();

        this.position = iwt * pos;
    },

    getWorldTransform = |e| -> {
        if (this.worldTransformDirty) {
            this.transform->identity();
            this.transform->translate(this.position);
            this.transform->scale(this.scale);
            this.transform->rotate(this.angle);
            this.transform->translate(this.origin * -1.0);
            this.worldTransformDirty = false;
        }

        if (this.parent == null) {
            return this.transform;
        }

        this.worldTransform = this.parent->getWorldTransform() * this.transform;

        return this.worldTransform;
    },

    getBB = func transformGetBB |size| -> {
        let res = BoundingBox.createFromPos(
            Vector2.create(),
            size
        );

        return res * this->getWorldTransform();
    },

    [object.symbols.setPropertyOperator] = |prop, val| -> {
        if (prop != "quadtreeDirty" && prop != "worldTransformDirty") {
            this.quadtreeDirty = true;
            this.worldTransformDirty = true;
        }

        return false;
    },
    
    getType = -> {
        return "Transform";
    }
} @ Component.create();

return Transform;