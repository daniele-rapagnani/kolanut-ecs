let Component = import("./Component");

let Label = {
    create = |font, text| => {
        return { 
            text = text ?? "",
            color = Color.white,
            inWorldView = false,
            font = font,
            size = null
        } @ Label;
    },

    getType = -> {
        return "Label";
    }
} @ Component.create();

return Label;