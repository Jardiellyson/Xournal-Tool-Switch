current_tool = 1;

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
            ["menu"] = "pentool",
            ["callback"] = "changeToPen",
            ["accelerator"] = "<Ctrl>j"
        }
    );

end;

function changeToPen()
    if getCurrentTool() == app.C.Tool_hand then
        setCurrentTool(current_tool);
    elseif getCurrentTool() == app.C.Tool_pen then
        setCurrentTool(2);
    else
        setCurrentTool(1);
    end;
end;

function changeToHand()
    --app.registerPlaceholder("Teste", "Description");
    if getCurrentTool() ~= app.C.Tool_hand then current_tool = getCurrentTool() end
    setCurrentTool(13);
end;

function getCurrentTool()
    return app.getActionState("select-tool");
end;

function setCurrentTool(tool)
    app.changeActionState("select-tool", tool);
end;

function getIndex(value, table)
    for i, v in pairs(table) do
        if v == value then
            return i;
        end;
    end;
    return nil;
end;

function teste()
    local tool = app.getActionState("select-tool");
end;
