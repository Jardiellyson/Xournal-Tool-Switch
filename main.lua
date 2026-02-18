current_tool = 1;
tool_index = 1;
color_index = 1;

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

    app.changeActionState("select-tool", app.C["Tool_" .. c.tools.list[tool_index]]);
if (getCurrentTool() ~= 2) and (getCurrentTool() ~= 13) then app.changeToolColor({["color"] = color_palette[color_index].color, ["selection"] = true}); end;
end;


function toggleColor()
    color_palette = getColorPalette();
    color_index = color_index + 1;
    if color_index > #color_palette then
        color_index = 1;
    end;

    if (getCurrentTool() ~= 2) and (getCurrentTool() ~= 13) then app.changeToolColor({["color"] = color_palette[color_index].color, ["selection"] = true}); end;
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
