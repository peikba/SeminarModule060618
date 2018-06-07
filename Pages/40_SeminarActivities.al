page 123456740 "Seminar Manager Activities"
{
    PageType = CardPart;
    SourceTable = "Seminar Cue";

    layout
    {
        area(content)
        {
            cuegroup(First)
            {
                field(Planned;Planned)
                {
                    
                }
                field(Registered;Registered)
                {
                    
                }
                actions
                {
                    action(New)
                    {
                        Caption='New Registration';
                        RunObject=page "Seminar Registration";
                        RunPageMode=Create;
                        Image=TileNew;
                    }
                }
            }
            cuegroup(Second)
            {
                field(Closed;Closed)
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    trigger OnOpenPage();

    begin
        if not get then begin
        init;
        insert;
        end;        
    end;
}