tableextension 50101 "WSB ASG Job" extends Job
{
    fields
    {
        // field(50100; "WSB ASG Proj. Attribute 1"; Text[250])
        // {
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Proj Attr. Value Mapping PGS"."WSB ASG Attribute Name" where("Table ID" = const(167), "No." = field("No."), "Job Attribute ID" = const(1)));
        //     Editable = false;
        //     Caption = 'Attribute Value 1';
        // }
        // field(50100; "WSB ASG Attribute Name"; Text[250])
        // {
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Project Attribute PGS".Name where(ID = field("Job Attribute ID"), Blocked = const(false)));
        //     Caption = 'Attrbute Name';
        // }
        field(50101; "WSB ASG Proj. Attribute 1"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,1';
        }
        field(50102; "WSB ASG Proj. Attribute 2"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,2';
        }
        field(50103; "WSB ASG Proj. Attribute 3"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,3';
        }
        field(50104; "WSB ASG Proj. Attribute 4"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,4';
        }
        field(50105; "WSB ASG Proj. Attribute 5"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,5';
        }
        field(50106; "WSB ASG Proj. Attribute 6"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,6';
        }
        field(50107; "WSB ASG Proj. Attribute 7"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,7';
        }
        field(50108; "WSB ASG Proj. Attribute 8"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,8';
        }
        field(50109; "WSB ASG Proj. Attribute 9"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,9';
        }
        field(50110; "WSB ASG Proj. Attribute 10"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,10';
        }
        field(50111; "WSB ASG Proj. Attribute 11"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,11';
        }
        field(50112; "WSB ASG Proj. Attribute 12"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,12';
        }
        field(50113; "WSB ASG Proj. Attribute 13"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,13';
        }
        field(50114; "WSB ASG Proj. Attribute 14"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,14';
        }
        field(50115; "WSB ASG Proj. Attribute 15"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,15';
        }
        field(50116; "WSB ASG Proj. Attribute 16"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,16';
        }
        field(50117; "WSB ASG Proj. Attribute 17"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,17';
        }
        field(50118; "WSB ASG Proj. Attribute 18"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,18';
        }
        field(50119; "WSB ASG Proj. Attribute 19"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,19';
        }
        field(50120; "WSB ASG Proj. Attribute 20"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,20';
        }
        field(50121; "WSB ASG Proj. Attribute 21"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,21';
        }
        field(50122; "WSB ASG Proj. Attribute 22"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,22';
        }
        field(50123; "WSB ASG Proj. Attribute 23"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,23';
        }
        field(50124; "WSB ASG Proj. Attribute 24"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,24';
        }
        field(50125; "WSB ASG Proj. Attribute 25"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,25';
        }
        field(50126; "WSB ASG Proj. Attribute 26"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,26';
        }
        field(50127; "WSB ASG Proj. Attribute 27"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,27';
        }
        field(50128; "WSB ASG Proj. Attribute 28"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,28';
        }
        field(50129; "WSB ASG Proj. Attribute 29"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = '';
            CaptionClass = '50100,29';
        }
    }
}