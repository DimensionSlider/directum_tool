unit routine_��;

interface

uses Messages, Dialogs, SqlExpr;

function FieldID( name:string; query:TSQLQuery ):integer;

implementation

uses Unit1;

function FieldID( name:string; query:TSQLQuery ):integer;
var
  i:integer;
  all_names:string;
begin
  result := query.FieldList.IndexOf( name );

  if result = -1 then
  begin
    result := 0;
    ShowMessage(  '������� �� ������ ' + name + #13 + '��������� �����: ' + #13 + query.FieldList.Text );
  end;
  
end;

end.
