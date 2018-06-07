codeunit 123456799 InstallCodeunit
{
    Subtype = Install;
    trigger OnInstallAppPerCompany();
    var
        myInt: Integer;
    begin
        if InitSetup then begin
            CreateResource;
            CreateSeminars;
        end;
    end;

    local procedure InitSetup(): Boolean;
    var
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";
        SeminarSetup: Record "Seminar Setup";
        SourceCodeSetup: Record "Source Code Setup";
        SourceCode: Record "Source Code";
    begin
        if SeminarSetup.get then
            exit(false);

        SeminarSetup.init;
        if SeminarSetup.Insert then;

        NoSerie.Code := 'SEM';
        NoSerie.Description := 'Seminars';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;

        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEM0000';
        if NoSerieLine.Insert then;
        SeminarSetup."Seminar Nos." := NoSerie.code;

        NoSerie.Code := 'SEMREG';
        NoSerie.Description := 'Seminar Registrations';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := false;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEMREG0000';
        if NoSerieLine.Insert then;
        SeminarSetup."Seminar Registration Nos." := NoSerie.code;

        NoSerie.Code := 'SEMREGPOST';
        NoSerie.Description := 'Posted Seminar Registrations';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEMPREG0000';
        if NoSerieLine.Insert then;
        SeminarSetup."Posted Seminar Reg. Nos." := NoSerie.code;

        SeminarSetup.Modify;

        SourceCode.Code := 'SEMINAR';
        if SourceCode.Insert then;
        SourceCodeSetup.get;
        //SourceCodeSetup.CSD_Seminar := 'SEMINAR';
        SourceCodeSetup.modify;
        exit(true);
    end;

    local procedure CreateResource();
    var
        Resource: Record Resource;
    begin
        Resource.init;
        Resource."No." := 'INSTR';
        Resource.Name := 'Mr. Instructor';
        Resource.validate("Gen. Prod. Posting Group", 'MISC');
        Resource."Base Unit of Measure" := 'HOUR';
        Resource."Direct Unit Cost" := 100;
        Resource."CSD_Quantity Per Day" := 8;
        Resource.Type := Resource.Type::Person;
        if Resource.Insert then;
        Resource."No." := 'ROOM 01';
        Resource.Name := 'Room 01';
        Resource.Type := Resource.Type::Machine;
        if Resource.Insert then;
    end;

    local procedure CreateSeminars();
    var
        Seminar: Record Seminar;
        Course: Record Course;

    begin
        if Course.FindSet then 
        repeat
            Seminar."No." := Course.Code;
            Seminar.Name := Course.Description;
            Seminar."Seminar Duration" := Course.Duration;
            Seminar."Seminar Price" := Course.Price;
            if Seminar.Insert then;
        until Course.Next = 0;
    end;

local procedure MyProcedure();
var
    cust : Record Customer;
    i : Integer;
begin
    if cust.FindSet then repeat
       if Confirm('%1 %2 %3', false, cust."No.",cust.Name,cust."Sales (LCY)") then
         error('');

    until cust.Next=0;

    if cust.Find then repeat

    until cust.Next=0;

end;
    var
        SeminarSetup: Record "Seminar Setup";
        Course: Record Course;

}