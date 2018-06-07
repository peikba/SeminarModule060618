table 123456740 "Seminar Cue"
{
    DataClassification = ToBeClassified;
    Caption='Seminar Cue';
    
    fields
    {
        field(1;"Primary Key";code[10])
        {

            DataClassification = ToBeClassified;
        }
        field(2;"Planned";Integer)
        {
            Caption ='Planned Registrations';
            FieldClass=FlowField;
            CalcFormula=count("Seminar Registration Header" where(Status=const("Planning")));
        }
        field(3;"Registered";Integer)
        {
            Caption ='Registered Registrations';
            FieldClass=FlowField;
            CalcFormula=count("Seminar Registration Header" where(Status=const("Registration")));
        }
        field(4;"Closed";Integer)
        {
            Caption ='Closed Registrations';
            FieldClass=FlowField;
            CalcFormula=count("Seminar Registration Header" where(Status=const("Closed")));
        }

    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }
}