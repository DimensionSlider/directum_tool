unit requisites_list;

interface

uses classes, SQLExpr, directum_metadata, routine_strings, SysUtils, Dialogs, routine_debug, routine_db;

//база реквизитов
type
  TRequisitesList = class(TList)
  db_connection: ^TSqlConnection;
  query : string;
  protected
   procedure ProcessRequisiteList();
  public

   function IndexByName( name:string ):integer;
   function IndexByCode( code:string ):integer;

    constructor Create(); overload;
    constructor Create( db_connection:TSQLConnection ); overload;

    procedure SetConnection( db_connection: TSQLConnection );
    procedure SetDownloadQuery( query_text:string );
    procedure DownloadRequisitesDescription();

    function GetRequisiteByCode(code:string):TPointerDIRRequisite;
end;

//реквзииты справочника
type TRefRequisitesList = class( TRequisitesList )
  function IndexByName( name:string ):integer;
  function IndexByCode( code:string ):integer;
  function ContainsName( name:string ) : boolean;
  function ContainsCode( code:string ) : boolean;
  function GetRequisiteByCode(code:string):TPointerDIRReferenceRequisite;
end;

implementation

uses Unit1;

//TRequisitesList---------------------------------------------------------------
constructor TRequisitesList.Create();
begin
  inherited Create();
end;

function TRequisitesList.GetRequisiteByCode(code:string):TPointerDIRRequisite;
begin
  result := TPointerDIRRequisite( Items[ IndexByCode( code ) ] );
end;     

function TRefRequisitesList.GetRequisiteByCode(code:string):TPointerDIRReferenceRequisite;
var
  index:integer;
begin
  index := IndexByCode( code );
  if index <> -1 then
    result := TPointerDIRReferenceRequisite( Items[ index ] )
  else
    result := nil;
end;


procedure TRequisitesList.DownloadRequisitesDescription();
var
  DirRequisiteFromPool : TPointerDIRRequisite;
begin
  query_tool.Close;
  query_tool.SQL.Text := query;
  query_tool.Open;

  while not  query_tool.EOF do
  begin
    New( DirRequisiteFromPool );

    //обход строки результата---------------------------------------------------
    DirRequisiteFromPool.code           := query_tool.Fields[ 0 ].DisplayText;
    DirRequisiteFromPool.fieldname      := query_tool.Fields[ 1 ].DisplayText;
    DirRequisiteFromPool.name           := query_tool.Fields[ 2 ].DisplayText;
    DirRequisiteFromPool.razd           := query_tool.Fields[ 3 ].DisplayText;
    DirRequisiteFromPool.stored         := YesNoToBool( query_tool.Fields[ 4 ].DisplayText );
    DirRequisiteFromPool.requisite_type := query_tool.Fields[ 5 ].DisplayText;
    DirRequisiteFromPool.align          := query_tool.Fields[ 6 ].DisplayText;
    DirRequisiteFromPool.priznValue     := query_tool.Fields[ query_tool.FieldList.IndexOf( 'PriznValues' ) ].DisplayText;
    DirRequisiteFromPool.typeStr        := query_tool.Fields[ query_tool.FieldList.IndexOf( '“ип—трокой' ) ].DisplayText;
    DirRequisiteFromPool.reftypeString  := query_tool.Fields[ query_tool.FieldList.IndexOf( '“ип—правочника—трокой' ) ].DisplayText;
    DirRequisiteFromPool.isReference    := StringAssigned(DirRequisiteFromPool.reftypeString);
    DirRequisiteFromPool.len            := StrToInt( MinusOneIfNull( query_tool.Fields[ 7 ].DisplayText ) );
    DirRequisiteFromPool.toch           := StrToInt( MinusOneIfNull( query_tool.Fields[ 8 ].DisplayText ) );
    DirRequisiteFromPool.vidan          := StrToInt( MinusOneIfNull( query_tool.Fields[ 9 ].DisplayText ) );
    DirRequisiteFromPool.ViewID         := StrToInt( MinusOneIfNull( query_tool.Fields[ 10 ].DisplayText ) );
    DirRequisiteFromPool.pick_values    := query_tool.Fields[ 11 ].DisplayText;
    DirRequisiteFromPool.exist_field    := YesNoToBool( query_tool.Fields[ 12 ].DisplayText );



    Add( DirRequisiteFromPool );
    query_tool.Next;
    //--------------------------------------------------------------------------
    
  end;

end;

procedure TRequisitesList.SetDownloadQuery( query_text:string );
begin
  query := query_text;
end;

constructor TRequisitesList.Create( db_connection:TSQLConnection );
begin
  inherited Create();
end;

procedure TRequisitesList.ProcessRequisiteList();
begin

end;

procedure TRequisitesList.SetConnection(db_connection: TSQLConnection);
begin

end;

function TRequisitesList.IndexByName( name:string ):integer;
var
  i:integer;
  requisite : TPointerDirRequisite;
begin
  result := -1;
  for i := 0 to Count - 1 do
  begin
    try
      requisite := TPointerDirRequisite( Items[i] );

      if requisite.name = name then result := i;

    except
      ShowMessage(  ' TRequisitesList.IndexByName ' + #13 +
                    ' i = ' + IntToStr(i) + #13 +
                    ' name = ' + name + #13 +
                    'requisite.name = ' + requisite.name
                    );
    end;
  end;
end;

function TRequisitesList.IndexByCode( code:string ):integer;
var
  i:integer;
  requisite : TPointerDirRequisite;
  ref_req   : TPointerDirReferenceRequisite;
begin
  result := -1;
  for i := 0 to Count - 1 do
  begin
    try
      requisite := TPointerDirRequisite( Items[i] );
      if requisite.code = code then result := i;

    except
      ShowMessage(  ' TRequisitesList.IndexByCode ' + #13 +
                    ' i = ' + IntToStr(i) + #13 +
                    ' code = ' + code + #13 +
                    'requisite.name = ' + requisite.name

                    );
    end;
  end;
end;

function TRefRequisitesList.IndexByCode( code:string ):integer;
var
  i:integer;
  requisite : TPointerDirReferenceRequisite;
begin
  result := -1;
  for i := 0 to Count - 1 do
  begin
    try
      requisite := TPointerDirReferenceRequisite( Items[i] );
      if requisite.code = code then result := i;

    except
      ShowMessage(  ' TRequisitesList.IndexByCode ' + #13 +
                    ' i = ' + IntToStr(i) + #13 +
                    ' code = ' + code + #13 +
                    'requisite.name = ' + requisite.name

                    );
    end;
  end;
end;


function TRefRequisitesList.IndexByName( name:string ):integer;
var
  i:integer;
  requisite : TPointerDirReferenceRequisite;
begin
  result := -1;
  for i := 0 to Count - 1 do
  begin
    try
      requisite := TPointerDirReferenceRequisite( Items[i] );
      if requisite.name = name then result := i;

    except
      ShowMessage(  ' TRequisitesList.IndexByName ' + #13 +
                    ' i = ' + IntToStr(i) + #13 +
                    ' name = ' + name + #13 +
                    'requisite.name = ' + requisite.name
                    );
    end;
  end;
end;

function TRefRequisitesList.ContainsName( name:string ):boolean;
var
  i:integer;
  requisite : TPointerDirReferenceRequisite;
begin
  result := false;
  for i := 0 to Count - 1 do
  begin
    try
      requisite := TPointerDirReferenceRequisite( Items[i] );
      if Pos( LowerCase( name ), ' ' + LowerCase( requisite.name ) ) > 0 then result := true;

    except
      ShowMessage(  ' TRequisitesList.ContainsName ' + #13 +
                    ' i = ' + IntToStr(i) + #13 +
                    ' name = ' + name + #13 +
                    'requisite.name = ' + requisite.name
                    );
    end;
  end;
end;


function TRefRequisitesList.ContainsCode( code:string ):boolean;
var
  i:integer;
  requisite : TPointerDirReferenceRequisite;
begin
  result := false;
  for i := 0 to Count - 1 do
  begin
    try
      requisite := TPointerDirReferenceRequisite( Items[i] );
      if Pos( LowerCase( code ), ' ' + LowerCase( requisite.code ) ) > 0 then result := true;

    except
      ShowMessage(  ' TRequisitesList.ContainsCode ' + #13 +
                    ' i = ' + IntToStr(i) + #13 +
                    ' name = ' + code + #13 +
                    'requisite.name = ' + requisite.name
                    );
    end;
  end;
end;

//------------------------------------------------------------------------------

end.
