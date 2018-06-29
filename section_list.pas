unit section_list;

interface

uses Classes, requisites_list, dialogs, SysUtils, directum_metadata;

//раздел справочника
type
  TPointerDIRSection = ^TDIRSection;
  TDIRSection = record
    uid,
    name,
    code,
    tablename: string[255];
    owner_object : Pointer;
    index        : integer;
    is_table     : boolean;
    requisites_list : TRefRequisitesList;
    preproc_name : string;
    object_type : TMetadataObjectType;
end;

type
TSectionList = class( TList )
  function IndexByName( name:string ):integer;
  function IndexByCode( code:string ):integer;
  function GetSectionByName( name:string ):TPointerDirSection;
  function GetSectionByCode( code:string ):TPointerDirSection;
  constructor Create();
end;

implementation

function TSectionList.IndexByName( name:string ):integer;
var
  i:integer;
begin
  result := -1;
  for i := 0 to Count - 1 do
  begin
    if TPointerDirSection( Items[i] ).name = name then
    result := i;
  end;
end;

function TSectionList.IndexByCode( code:string ):integer;
var
  i:integer;
begin
  try
    result := -1;
    for i := 0 to Count - 1 do
    begin
      if TPointerDirSection( Items[i] ).code = code then result := i;
    end;
  except
    ShowMessage( 'TSectionList.IndexByCode error ' + IntToStr(i) + ' ' + code );
  end;
end;

function TSectionList.GetSectionByName( name: string ):TPointerDirSection;
begin
  result := TPointerDirSection( Items[ IndexByName( name ) ] );
end;

function TSectionList.GetSectionByCode( code: string ):TPointerDirSection;
var
  i:integer;
begin
  i:= IndexByCode( code );
  if ( i<0 ) or ( i > Count-1 ) then
  begin
    ShowMessage( 'Ошибка поиска секции, код: ' + code);
  end;
  result := TPointerDirSection( Items[ i ] );
end;

constructor TSectionList.Create();
begin
  inherited Create();
end;


end.
