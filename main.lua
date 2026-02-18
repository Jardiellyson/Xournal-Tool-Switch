require("configs");
current_tool = 1;
tool_index = 1;
color_index = {
    pen = 1,
    highlighter = 1
};

function initUi()
    print("Plugin de atalhos iniciado");



    app.registerUi(
        {
            ["menu"] = "handtool",
            ["callback"] = "changeToHand",
            ["accelerator"] = "<Ctrl>k"
        }
    );


    app.registerUi(
        {
            ["menu"] = "toggleTool",
            ["callback"] = "toggleTool",
            ["accelerator"] = "<Ctrl>j"
        }
    );

    app.registerUi(
        {
            ["menu"] = "toggleColor",
            ["callback"] = "toggleColor",
            ["accelerator"] = "<Ctrl>u"
        }
    );

end;

function changeToHand()
    if getCurrentTool() ~= app.C.Tool_hand then current_tool = getCurrentTool() end
    setCurrentTool(13);
end;

function toggleTool()
    if getCurrentTool() ~= 13 then tool_index = tool_index + 1; end;
    color_palette = getColorPalette();
    if tool_index > #c.tools.list then
        tool_index = 1;
    end;

    --color = color_palette[color_index].color;

    app.changeActionState("select-tool", app.C["Tool_" .. c.tools.list[tool_index]]);
    --setToolColor(color);
end;


function toggleColor()
    color_palette = getColorPalette();
    if getCurrentTool() == 1 then
        color_index.pen = color_index.pen + 1;
        if color_index.pen > #color_palette then color_index.pen = 1; end;
    elseif getCurrentTool() == 3 then
        color_index.highlighter = color_index.highlighter + 1;
        if color_index.pen > #color_palette then color_index.pen = 1; end;
    end;

    color = getToolColor();
    setToolColor(color);
end;

function getCurrentTool()
    return app.getActionState("select-tool");
end;

function setCurrentTool(tool)
    app.changeActionState("select-tool", tool);
end;

function getColorPalette()
    return app.getColorPalette();
end;

function setToolColor(color)
    if (getCurrentTool() == 1) or (getCurrentTool() == 3) then
        app.changeToolColor({["color"] = color, ["selection"] = true});
    end;
end;

function getToolColor()
    color_palette = getColorPalette();
     if getCurrentTool() == 1 then
        return color_palette[color_index.pen].color;
    elseif getCurrentTool() == 3 then
        return color_palette[color_index.highlighter].color;
    end;
end;
